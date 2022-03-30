#ifndef MATRIX_MULT_H
#define MATRIX_MULT_H

#include <hls_stream.h>
#include "ap_int.h"
#include "ap_axi_sdata.h"

#define DIM 64
#define T	float


typedef hls::axis<T, 1, 1, 1> t_packet;


void mmult_wrapper(hls::stream<t_packet> &input_stream,
		hls::stream<t_packet> &output_stream);


#endif /* MATRIX_MULT_H */
