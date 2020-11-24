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
#include <stdint.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <pthread.h>
#include "dma-proxy.h"

static int test_size;

int main(int argc, char *argv[]) {
	struct dma_proxy_channel_interface *rx_proxy_interface_p;
	int rx_proxy_fd, i;
	int dummy;
	int counter;

	if (argc != 2) {
		printf("Usage: moller <# of DMA transfers to perform> \n");
		exit(EXIT_FAILURE);
	}

	printf("Transfer started\n");

	// For this test, its just 4 bytes every time
	test_size = 4;

	// Open the DMA proxy device for the receive channel
	rx_proxy_fd = open("/dev/dma_proxy_rx", O_RDWR);

	// Map the receive channels memory into user space so it's accessible
	rx_proxy_interface_p = (struct dma_proxy_channel_interface *)mmap(NULL, sizeof(struct dma_proxy_channel_interface),
									PROT_READ | PROT_WRITE, MAP_SHARED, rx_proxy_fd, 0);

	if (rx_proxy_interface_p == MAP_FAILED) {
		printf("Failed to mmap\n");
		exit(EXIT_FAILURE);
	}

	/* Set up the length for the DMA transfer and initialize the transmit buffer to a known pattern. Since
 	 */

	for (counter = 0; counter < atoi(argv[1]); counter++) {

		/* Initialize the receive buffer so that it can be verified after the transfer is done
		 * and setup the size of the transfer for the receive channel
		 */
		for (i = 0; i < test_size; i++) {
			rx_proxy_interface_p->buffer[i] = 0;
		}

		rx_proxy_interface_p->length = test_size;

		// Perform a receive DMA transfer and after it finishes check the status
		ioctl(rx_proxy_fd, 0, &dummy);

		if (rx_proxy_interface_p->status != PROXY_NO_ERROR) {
			printf("Proxy rx transfer error\n");
		}

		// Print out the data we have recieved
		for (i = 0; i < test_size; i+=4) {
			printf("Buffer[%d]: 0x%.02X\n", (i / 4), *(uint32_t*)&rx_proxy_interface_p->buffer[i]);
		}
	}

	// Unmap the proxy channel interface memory and close the device files before leaving
	munmap(rx_proxy_interface_p, sizeof(struct dma_proxy_channel_interface));

	close(rx_proxy_fd);

	printf("Transfer complete\n");

	return 0;
}

