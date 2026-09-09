void sscal( int length, int a, float *x, int stride ){ 
  for (int i = 0; i < length; i += stride )
    x[i] = a * x[i];
}

