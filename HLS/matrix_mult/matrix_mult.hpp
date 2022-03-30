#ifndef MATRIX_MULT_H
#define MATRIX_MULT_H

#include <hls_stream.h>
#include "ap_int.h"
#include "ap_axi_sdata.h"

#define DIM 64
#define T	float

void mmult_hw(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM]);

#endif /* MATRIX_MULT_H */
