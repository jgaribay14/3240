void dgemm(int length, double *A, double *B, double *C) {
    // Perform matrix multiplication: C[i][j] = Σ (A[i][k] * B[k][j])
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < length; j++) {
            // Overwrite C[i][j]
            C[i * length + j] = 0.0;
            for (int k = 0; k < length; k++) {
                C[i * length + j] += A[i * length + k] * B[k * length + j];
            }
        }
    }
}

