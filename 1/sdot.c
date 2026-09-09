float sdot( int length, float *X, float *Y) { 
    float result = 0;
    for (int i = 0; i < length - 1; i++) {
        result = result + X[i] * Y[i];
    }
    return result;
}

