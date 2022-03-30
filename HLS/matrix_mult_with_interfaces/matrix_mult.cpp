#include <stdio.h>
#include <stdlib.h>

#include <hls_stream.h>
#include "ap_int.h"
#include "ap_axi_sdata.h"


#include "matrix_mult.hpp"

void mmult_hw(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM])
{

	int const FACTOR = DIM/2;
#pragma HLS INLINE
#pragma HLS array_partition variable=a block factor=FACTOR dim=2
#pragma HLS array_partition variable=b block factor=FACTOR dim=1

	// matrix multiplication of a A*B matrix
	L1:for (int ia = 0; ia < DIM; ++ia)
		L2:for (int ib = 0; ib < DIM; ++ib)
		{
#pragma HLS PIPELINE II=1
			T sum = 0;
			L3:for (int id = 0; id < DIM; ++id)
				sum += a[ia][id] * b[id][ib];
			out[ia][ib] = sum;
		}

		return;
}

void mmult_wrapper(hls::stream<t_packet> &input_stream,
		hls::stream<t_packet> &output_stream){
#pragma HLS INTERFACE axis register_mode=both register port=input_stream
#pragma HLS INTERFACE axis register_mode=both register port=output_stream
#pragma HLS INTERFACE ap_ctrl_none port=return


	T a[DIM][DIM], b[DIM][DIM], out[DIM][DIM];


	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
#pragma HLS PIPELINE II=1
			t_packet tmp;
			input_stream >> tmp;
			a[i][j] = tmp.data;
		}
	}
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
#pragma HLS PIPELINE II=1
			t_packet tmp;
			input_stream >> tmp;
			b[i][j] = tmp.data;

		}
	}


	mmult_hw(a, b, out);

	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
#pragma HLS PIPELINE II=1
			t_packet tmp;
			tmp.data = out[i][j];
			tmp.last = (i == DIM-1) && (j == DIM-1);
			output_stream << tmp;

		}
	}



}
