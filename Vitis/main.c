
#include <stdlib.h>
#include <stdio.h>
//#include <stdbool.h>
#include <assert.h>
//#include <math.h>

//#include <fcntl.h>              // Flags for open()
//#include <sys/stat.h>           // Open() system call
//#include <sys/types.h>          // Types for open()
//#include <unistd.h>             // Close() system call
//#include <string.h>             // Memory setting and copying
//#include <getopt.h>             // Option parsing
#include <errno.h>              // Error codes


#include "xaxidma.h"
#include "xparameters.h"
#include "xdebug.h"
#include "xtime_l.h"


//#include "xsdps.h"
//#include "ff.h"
//#include "xil_cache.h"
#include "xplatform_info.h"

//#include "platform.h"
#include "xil_printf.h"


//#include "xbasic_types.h"


#define T float
#define DIM 64


/******************** Constant Definitions **********************************/


// Device hardware build related constants.

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#ifdef XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#define DDR_BASE_ADDR		XPAR_AXI_7SDDR_0_S_AXI_BASEADDR
#elif defined (XPAR_MIG7SERIES_0_BASEADDR)
#define DDR_BASE_ADDR	XPAR_MIG7SERIES_0_BASEADDR
#elif defined (XPAR_MIG_0_BASEADDR)
#define DDR_BASE_ADDR	XPAR_MIG_0_BASEADDR
#elif defined (XPAR_PSU_DDR_0_S_AXI_BASEADDR)
#define DDR_BASE_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#endif

#ifndef DDR_BASE_ADDR
#warning CHECK FOR THE VALID DDR ADDRESS IN XPARAMETERS.H, \
		 DEFAULT SET TO 0x01000000
#define MEM_BASE_ADDR		0x01000000
#else
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x1000000)
#endif

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x01000000)
#define RX_BUFFER_HIGH		(MEM_BASE_ADDR + 0x011FFFFF)




// Global variables for SD card access


// Define global values for HLS example IP
//XLstm_forward_hw hls_lstm;
//XLstm_forward_hw_Config *hls_lstm_cfg;



// DEfine global values for DMA
XAxiDma AxiDma;
XAxiDma_Config *CfgPtr;

float *TxBufferPtr = (float*)TX_BUFFER_BASE;
float *RxBufferPtr = (float*)RX_BUFFER_BASE;

u32 init_DMA(){
	u32 Status;
	int DeviceId = 0;
	// Initialize the XAxiDma device.
	CfgPtr = XAxiDma_LookupConfig(DeviceId);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DeviceId);
		return XST_FAILURE;
	}
	Status = XAxiDma_CfgInitialize(&AxiDma, CfgPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}
	if(XAxiDma_HasSg(&AxiDma)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	// Disable interrupts, we use polling mode
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	// Flush the buffers before the DMA transfer, in case the Data Cache is enabled
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, 2*DIM*DIM*sizeof(float));
	Xil_DCacheFlushRange((UINTPTR)RxBufferPtr, DIM*DIM*sizeof(float));

	return XST_SUCCESS;
}

void matrix_multiply_ref(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM])
{
	// matrix multiplication of a A*B matrix
	for (int ia = 0; ia < DIM; ++ia){
		for (int ib = 0; ib < DIM; ++ib){

			float sum = 0;

			for (int id = 0; id < DIM; ++id)

				sum += a[ia][id] * b[id][ib];

			out[ia][ib] = sum;
		}
	}
	return;
}

u32 matrix_mult_hw(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM]){
	u32 Status;

	int idx = 0;
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++){
			TxBufferPtr[idx++] = a[i][j];
		}
	}
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++){
			TxBufferPtr[idx++] = b[i][j];
		}
	}

	// Flush the buffers before the DMA transfer, in case the Data Cache is enabled
	Xil_DCacheFlushRange((UINTPTR)TxBufferPtr, 2*DIM*DIM*sizeof(float));
	Xil_DCacheFlushRange((UINTPTR)RxBufferPtr, DIM*DIM*sizeof(float));


	Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) RxBufferPtr, DIM*DIM*sizeof(float), XAXIDMA_DEVICE_TO_DMA);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}


	Status = XAxiDma_SimpleTransfer(&AxiDma,(UINTPTR) TxBufferPtr, 2*DIM*DIM*sizeof(float), XAXIDMA_DMA_TO_DEVICE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// TODO passar a usar interrupts em vez de busy waiting
	while (1) {
		//u32 res = 0;

		u32 rx_busy = XAxiDma_Busy(&AxiDma,XAXIDMA_DEVICE_TO_DMA);
		u32 tx_busy = XAxiDma_Busy(&AxiDma,XAXIDMA_DMA_TO_DEVICE);

		//res = res | rx_busy | tx_busy;

		if(!(rx_busy | tx_busy))
			break;
	}

	idx = 0;
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++){
			out[i][j] = RxBufferPtr[idx++];
		}
	}

	return XST_SUCCESS;
}

int main()
{
    //init_platform();

	printf("\r\n--- Entering main() --- \r\n");

	u32 Status;

	XTime tStart, tEnd;

	T matOp1[DIM][DIM];
	T matOp2[DIM][DIM];
	T matMult_sw[DIM][DIM];
	T matMult_hw[DIM][DIM];

	// Matrix Initiation
	for(int i = 0; i<DIM; i++)
		for(int j = 0; j<DIM; j++)
			matOp1[i][j] = (float)(i+j);

	for(int i = 0; i<DIM; i++)
		for(int j = 0; j<DIM; j++)
			matOp2[i][j] = (float)(i*j);
	// End of Initiation

	printf("NORMAL MODE\r\n");
	XTime_GetTime(&tStart);
	matrix_multiply_ref(matOp1, matOp2, matMult_sw);
	XTime_GetTime(&tEnd);
	printf("Software version took %.5f s.\n", 1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND));



	Status = init_DMA();
	if(Status != XST_SUCCESS){
		printf("Error on init_DMA()\n");
		return Status;
	}

	printf("HW MODE\r\n");
	XTime_GetTime(&tStart);
	Status = matrix_mult_hw(matOp1, matOp2, matMult_hw);
	XTime_GetTime(&tEnd);

	if(Status != XST_SUCCESS){
		printf("Error on matrix_mult_hw()\n");
		return Status;
	}

	printf("Hardware version took %.5f s.\n", 1.0 * (tEnd - tStart) / (COUNTS_PER_SECOND));


	// Matrix comparison
	int err = 0;
	for (int i = 0; i<DIM; i++)
		for (int j = 0; j<DIM; j++){
			//printf("matMult_sw[%d][%d] = %f --- matMult_hw[%d][%d] = %f\n", i, j, matMult_sw[i][j], i, j, matMult_hw[i][j]);

			if (matMult_sw[i][j] != matMult_hw[i][j])
				err++;
		}
	if (err == 0)
		printf("Matrices identical ... Test successful!\r\n");
	else
		printf("Test failed!\r\n");

	//cleanup_platform();
	return XST_SUCCESS;
}

