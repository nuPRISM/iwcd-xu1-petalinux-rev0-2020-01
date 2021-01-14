//////////////////////////////////////////////////////////////////////////////////
// Company: 		TRIUMF
// Engineer: 		Adapted by Luke Bidulka, writen by Masoud Mokhtari
//
// Create Date: 	02/11/2020
// Design Name: 	Adapted Data processor Linux application
// Project Name: 	NuPRISM (Originally DarkSide DAQ Filter)
//////////////////////////////////////////////////////////////////////////////////
//
// This purpose of this application is to test the DMA data transmission functionality. 
// It is essentially the same as Masoud Mokhtari's Data Processor application, 
// which is based on a Xilinx Petalinux wiki page regarding DMA access from User Space 
// (found here: https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842418/Linux+DMA+From+User+Space). 
// The DMA driver and dma-proxy test application can be found on that page or in this 
// repository as well. The wiki page has good information for understanding some DMA concepts
// and has instructions for the setup of the DMA test. For this application, the DMA 
// rx and tx are looped back to the PS of the SOM in the same way they are for the 
// dma-proxy test and should likely be changed for real operation beyond the purposes of 
// this illustrative program.
//


// Dependencies
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <pthread.h>
#include "dmaproxy.h"

#define MAX_STRING_LENGTH 100

// Static structures
static struct dma_proxy_channel_interface *tx_proxy_interface_p;
static struct dma_proxy_channel_interface *rx_proxy_interface_p;
static int tx_proxy_fd;
static int transmit_size;
static FILE *fh;

/*
 * read_file Function
 * Read byte_count number of bytes from file and puts it in transmit buffer
 */
int read_file(int byte_count, char* input_file) {

	size_t num_bytes_read = 0;

	// Open the file for reading
    fh = fopen(input_file, "r");

	if (!fh) {
		printf("Could not open file for reading: %s \n", input_file);
		return -1;
	}

	// Load file content onto transmit buffer
	num_bytes_read = fread(tx_proxy_interface_p->buffer, 1, byte_count, fh);
	if (num_bytes_read <= 0){
		printf("Can't read from file! \n");
		fclose(fh);
		return -2;
	}
	else {
		printf("Successfully read %d bytes from %s! \n", (int) num_bytes_read, input_file);
	}

	fclose(fh);

	return 0;
}

/*
 * write_file Function
 * append byte_count bytes into a file
 */ 
int write_file(int byte_count, char* output_file) {

	// Open file for appending
	fh = fopen(output_file, "w");

	if (!fh) {
		printf("Could not open file for writing: %s \n", output_file);
		return -1;
	}

	// Append to output file
	if (fwrite(rx_proxy_interface_p->buffer, byte_count, 1, fh) != 1){
		printf("Can't write to file! \n");
		fclose(fh);
		return -2;
	}
	else {
		printf("Successfully wrote %d bytes into %s! \n", byte_count, output_file);
	}

	fclose(fh);

	return 0;
}

/*
 * tx_thread Function
 * Create dma_counter number of transactions
 */
static void *tx_thread() {

	int timeout;

	timeout = 30000;

	printf("Requesting transmission of input data... \n");
	ioctl(tx_proxy_fd, 0, &timeout);

	if (tx_proxy_interface_p->status != PROXY_NO_ERROR) {
		printf("Proxy tx transfer error with error number %d\n", tx_proxy_interface_p->status);
	}
	else {
		printf("Input data transmission successfully completed! \n");
	}

	return NULL;
}

/* 
 * main Function
 * Initiate data transmission from input file and write received data into output file
 */ 
int main(int argc, char *argv[]) {

	printf("\nData Processor Program Started! \n \n");

	// Local variables
	int rx_proxy_fd, i;
	int timeout;
	int receive_size;
	int result;
	pthread_t tid;
	FILE *module_fd;
	char buf[16];

	// Ensure that 4 parameter values are passed in
	if (argc != 5) {
		printf("Required inputs: <# of bytes in each transmit transfer (< 3MB)> <# max bytes in each receive transfer (< 3MB)> <input file path> <output file path>\n \n");
		exit(EXIT_FAILURE);
	}

	// Assign input parameters to corresponding variables
	transmit_size = atoi(argv[1]);
	receive_size = atoi(argv[2]);

	// Ensure that there are not any transfer size violations
	if (transmit_size > MAX_TRANSFER_SIZE) {
		printf("Max transfer size is 3MB. \n");
		printf("Setting transmit size to 3MB. \n \n");
		transmit_size = MAX_TRANSFER_SIZE;
	}

	if (receive_size > MAX_TRANSFER_SIZE) {
		printf("Max transfer size is 3MB. \n");
		printf("Setting receive size to 3MB. \n \n");
		receive_size = MAX_TRANSFER_SIZE;
	}

	// Open the DMA proxy device for the transmit and receive channels
	tx_proxy_fd = open("/dev/dma_proxy_tx", O_RDWR);
	if (tx_proxy_fd < 1) {
		printf("Unable to open DMA proxy device file \n \n");
		exit(EXIT_FAILURE);
	}

	rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);
	if (rx_proxy_fd < 1) {
		printf("Unable to open DMA proxy device file \n \n");
		exit(EXIT_FAILURE);
	}

	// Map the transmit and receive channels memory into user space so it's accessible
	tx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, tx_proxy_fd, 0);

	rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);
									
	if ((rx_proxy_interface_p == MAP_FAILED) || (tx_proxy_interface_p == MAP_FAILED)) {
		printf("Failed to mmap\n");
		exit(EXIT_FAILURE);
	}

	// Read file and put it in transmit buffer
	printf("Reading input data from %s... \n", argv[3]);
	result = read_file(transmit_size, argv[3]);
	if (result != 0) {
		exit(EXIT_FAILURE);
	}

	// Create transmit threads (Threads are needed since ioctl is blocking)
	tx_proxy_interface_p->length = transmit_size;
	pthread_create(&tid, NULL, tx_thread, NULL);

	// Initiate receive transfers
	rx_proxy_interface_p->length = receive_size;

	timeout = 30000;

	printf("Flushing buffer... \n");
	for (i=0; i<receive_size; i++){
		rx_proxy_interface_p->buffer[i] = 0;
	}

	printf("\nRequesting receive transfer... \n");
	ioctl(rx_proxy_fd, 0, &timeout);

	if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
		printf("Proxy rx transfer error with error number %d\n", rx_proxy_interface_p->status);
	}
	else {
		printf("Received a packet(s) \n");
		// Append data to file
		printf("Writing data to %s... \n", argv[4]);
		write_file(receive_size, argv[4]);
	}

	// Wait for transfer to finish if it has not
	printf("\nWaiting for transfer completion...\n");
	pthread_join(tid, NULL);
	printf("Transfer is completed!\n");

	// Unmap the proxy channel interface memory and close the device files before leaving
	munmap(tx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));

	// Close device files
	close(tx_proxy_fd);
	close(rx_proxy_fd);

	printf("\nData Processor Program Ended!\n \n");

	return 0;
}
