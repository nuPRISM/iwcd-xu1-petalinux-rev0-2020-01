//////////////////////////////////////////////////////////////////////////////////
// Company: 		TRIUMF
// Engineer: 		Masoud Mokhtari
// 
// Create Date: 	18/03/2020 11:38:42 AM
// Design Name: 	Header for dataprocessor application
// Project Name: 	DarkSide DAQ Filter
//////////////////////////////////////////////////////////////////////////////////

#ifndef _DMA_PROXY_H_
#define _DMA_PROXY_H_

#undef INTERNAL_TEST

#define CHANNEL_COUNT 		2
#define TX_CHANNEL		    0
#define RX_CHANNEL		    1
#define ERROR 			    -1
#define NOT_LAST_CHANNEL 	0
#define LAST_CHANNEL 		1
#define DRIVER_NAME 		"dma_proxy"

#define MAX_TRANSFER_SIZE (3 * 1024 * 1024)

struct dma_proxy_channel_interface {
	unsigned char buffer[MAX_TRANSFER_SIZE];
	enum proxy_status { PROXY_NO_ERROR = 0, PROXY_BUSY = 1, PROXY_TIMEOUT = 2, PROXY_ERROR = 3 } status;
	unsigned int length;
};

#endif /* _DMA_PROXY_H_ */
