/* DMA Proxy Test Application
 *
 * This application is intended to be used with the DMA Proxy device driver. It provides
 * an example application showing how to use the device driver to do user space DMA
 * operations.
 *
 * The driver allocates coherent memory which is non-cached in a s/w coherent system.
 * Transmit and receive buffers in that memory are mapped to user space such that the
 * application can send and receive data using DMA channels (transmit and receive).
 *
 * It has been tested with an AXI DMA system with transmit looped back to receive.
 * Since the AXI DMA transmit is a stream without any buffering it is throttled until
 * the receive channel is running.  
 * 
 * More complete documentation is contained in the device driver (dma-proxy.c).
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <pthread.h>
#include "dma-proxy.h"

static struct dma_proxy_channel_interface *tx_proxy_interface_p;
static struct dma_proxy_channel_interface *rx_proxy_interface_p;
static int tx_proxy_fd;
static int test_size; 
static FILE *fh;

/*
 * read_file Function
 * Read file_count number of bytes from file and puts it in transmit buffer
 */
int read_file(int sd_count, char* input_file) {

	size_t num_bytes_read = 0;

	// Open the file for reading
    fh = fopen(input_file, "r");

	if (!fh) {
		printf("Could not open file for reading: %s \n", input_file);
		return -1;
	}

	// Load file content onto transmit buffer
	num_bytes_read = fread(tx_proxy_interface_p->buffer, 1, sd_count, fh);
	if (num_bytes_read <= 0){
		printf("Can't read from file! \n");
		fclose(fh);
		return -2;
	}

	printf("Number of bytes read from file: %d \n", (int) num_bytes_read);

	fclose(fh);

	return 0;
}

/*
 * write_file Function
 * append file_count bytes into a file
 */ 
int write_file(int sd_count, char* output_file) {

	// Open file for appending
	fh = fopen(output_file, "w");

	if (!fh) {
		printf("Could not open file for writing: %s \n", output_file);
		return -1;
	}

	// Append to output file
	if (fwrite(rx_proxy_interface_p->buffer, sd_count, 1, fh) != 1){
		printf("Can't write to file! \n");
		fclose(fh);
		return -2;
	}
	else {
		printf("Successfully wrote %d bytes into %s! \n", sd_count, output_file);
	}

	fclose(fh);

	return 0;
}

/* The following function is the transmit thread to allow the transmit and the
 * receive channels to be operating simultaneously. The ioctl calls are blocking
 * such that a thread is needed.
 */
void *tx_thread(int dma_count)
{
	int dummy, i, counter;

	/* Set up the length for the DMA transfer and initialize the transmit
 	 * buffer to a known pattern.
 	 */
	tx_proxy_interface_p->length = test_size;

	for (counter = 0; counter < dma_count; counter++) {
    		for (i = 0; i < test_size; i++)
       			tx_proxy_interface_p->buffer[i] = counter + i;

		/* Perform the DMA transfer and the check the status after it completes
	 	 * as the call blocks til the transfer is done.
 		 */
		ioctl(tx_proxy_fd, 0, &dummy);

		if (tx_proxy_interface_p->status != PROXY_NO_ERROR)
			printf("Proxy tx transfer error\n");
	}
}


int main(int argc, char *argv[])
{
	int rx_proxy_fd, i;
	int dummy;
	int timeout;
	int counter;
	int result;
	pthread_t tid;

	printf("DMA proxy test\n");

	// Be sure 3 parameters are passed in
	if (argc != 4) {
		printf("Usage: dma-proxy-test <# of bytes in each transfer (< 3MB)> <input file path> <output file path>\n");
		exit(EXIT_FAILURE);
	}

	/* Get the size of the test to run, making sure it's not bigger than the statically configured memory size)
	 */
	test_size = atoi(argv[1]);
	if (test_size > TEST_SIZE)
		test_size = TEST_SIZE;

	/* Open the DMA proxy device for the transmit and receive channels
 	 */
	tx_proxy_fd = open("/dev/dma_proxy_tx", O_RDWR);

	if (tx_proxy_fd < 1) {
		printf("Unable to open DMA proxy device file");
		exit(EXIT_FAILURE);
	}

	rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);
	if (tx_proxy_fd < 1) {
		printf("Unable to open DMA proxy device file");
		exit(EXIT_FAILURE);
	}

	/* Map the transmit and receive channels memory into user space so it's accessible
 	 */
	tx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, tx_proxy_fd, 0);

	rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
	if ((rx_proxy_interface_p == MAP_FAILED) || (tx_proxy_interface_p == MAP_FAILED)) {
		printf("Failed to mmap\n");
		exit(EXIT_FAILURE);
	}

	// Read data from file and put it in transmit buffer
	printf("Reading input data from %s... \n", argv[3]);
	result = read_file(test_size, argv[2]);
	if (result != 0) {
		exit(EXIT_FAILURE);
	}

	printf("\nInitiating data transfer...\n");

	// Printout the data to be transmitted
	printf("To be transferred:\n");
	for (i = 0; i < test_size; i++)
	{
		printf("byte %i: %x\n", i, rx_proxy_interface_p->buffer[i]);
	}

	// Create dummy transfer data
	// for (i = 0; i < test_size; i++)
	// 	tx_proxy_interface_p->buffer[i] = i;

	/* Create the thread for the transmit processing
	 */
	pthread_create(&tid, NULL, (void*)tx_thread, NULL);
	/* Set up the length for the DMA transfer
 	 */
	tx_proxy_interface_p->length = test_size; 

	rx_proxy_interface_p->length = test_size;

	timeout = 30000;
	
	/* Flush the recieve buffer
	*/
	printf("flushing buffer... \n");
	for (i = 0; i < test_size; i++)
		rx_proxy_interface_p->buffer[i] = 0;

	/* Perform a receive DMA transfer and after it finishes check the status
		*/
	printf("\nRequesting receive transfer...\n");
	ioctl(rx_proxy_fd, 0, &timeout);

	if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		printf("Proxy rx transfer error with error number %d\n", rx_proxy_interface_p->status);
	}
	else {
		printf("Received a packet(s) \n");
		// Append data to SD card
		printf("Writing data to %s... \n", argv[3]);
		write_file(test_size, argv[3]);
	}
	/* Verify the data recieved matchs what was sent (tx is looped back to tx)
		*/
	// for (i = 0; i < test_size; i++)
	// 	if (rx_proxy_interface_p->buffer[i] != (unsigned char)(counter + i))
	// 		printf("buffer not equal, index = %d, data = %d expected data = %d\n", i, 
	// 			rx_proxy_interface_p->buffer[i], (unsigned char)(counter + i));

	// Wait for transfer to finish if it has not
	printf("\nWaiting for transfer completion...\n");
	pthread_join(tid, NULL);
	printf("Transfer is completed!\n");

	/* Unmap the proxy channel interface memory and close the device files before leaving
	 */
	munmap(tx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));

	close(tx_proxy_fd);
	close(rx_proxy_fd);

	printf("DMA proxy test complete\n");

	return 0;
}