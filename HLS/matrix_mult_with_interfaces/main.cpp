#include <stdio.h>
#include <stdlib.h>

#include <hls_stream.h>
#include "ap_int.h"
#include "ap_axi_sdata.h"


#include "matrix_mult.hpp"


void matrix_multiply_ref(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM])
{
	// matrix multiplication of a A*B matrix
	for (int ia = 0; ia < DIM; ++ia)
		for (int ib = 0; ib < DIM; ++ib)
		{

			float sum = 0;

			for (int id = 0; id < DIM; ++id)

				sum += a[ia][id] * b[id][ib];

			out[ia][ib] = sum;
		}

		return;
}


int main(){
	int ret_val = 0;

	int i,j, err;

	T matOp1[DIM][DIM];
	T matOp2[DIM][DIM];
	T matMult_sw[DIM][DIM];
	T matMult_hw[DIM][DIM];

	/** Matrix Initiation */
	for(i = 0; i<DIM; i++)
		for(j = 0; j<DIM; j++)
			matOp1[i][j] = (float)(i+j);

	for(i = 0; i<DIM; i++)
		for(j = 0; j<DIM; j++)
			matOp2[i][j] = (float)(i*j);
	/** End of Initiation */

	printf("NORMAL MODE\r\n");
	matrix_multiply_ref(matOp1, matOp2, matMult_sw);


	hls::stream<t_packet> input_stream("input_stream");
	hls::stream<t_packet> output_stream("output_stream");


	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
			t_packet tmp;
			tmp.data = matOp1[i][j];
			tmp.last = 0;
			input_stream << tmp;
		}
	}
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
			t_packet tmp;
			tmp.data = matOp2[i][j];
			if(i == DIM-1 && j == DIM-1){
				tmp.last = 1;
			} else
				tmp.last = 0;
			input_stream << tmp;
		}
	}

	printf("HW MODE\r\n");
	mmult_wrapper(input_stream, output_stream);

	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++)
		{
			t_packet tmp;
			output_stream >> tmp;
			matMult_hw[i][j] = tmp.data;

			if(i == DIM-1 && j == DIM-1)
				assert(tmp.last);
			else
				assert(!tmp.last);
		}
	}



	/** Matrix comparison */
	err = 0;
	for (i = 0; (i<DIM && !err); i++)
		for (j = 0; (j<DIM && !err); j++)
			if (matMult_sw[i][j] != matMult_hw[i][j])
				err++;

	if (err == 0)
		printf("Matrixes identical ... Test successful!\r\n");
	else
		printf("Test failed!\r\n");

	return err;
}
