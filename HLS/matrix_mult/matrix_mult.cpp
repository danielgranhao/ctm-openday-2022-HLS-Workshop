#include <stdio.h>
#include <stdlib.h>

#include "matrix_mult.hpp"

void mmult_hw(T a[DIM][DIM], T b[DIM][DIM], T out[DIM][DIM])
{

	// matrix multiplication of a A*B matrix
	L1:for (int ia = 0; ia < DIM; ++ia)
		L2:for (int ib = 0; ib < DIM; ++ib)
		{
			T sum = 0;
			L3:for (int id = 0; id < DIM; ++id)
				sum += a[ia][id] * b[id][ib];
			out[ia][ib] = sum;
		}

		return;
}
