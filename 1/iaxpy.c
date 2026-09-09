void iaxpy( int length, int a, int *x, int *y, int *result ){ 
	for (int i = 0; i < length; i++ )
		result[i] = a * x[i] + y[i];
}

