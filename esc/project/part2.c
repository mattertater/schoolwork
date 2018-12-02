void main() {
    // These would change per iteration when calculating step response
    float xk = 0,
          ykm1 = 0,
          ykm2 = 0;
    
    // Discrete - Actual
    float yd1_actual = xk - 1.12051*ykm1 + 0.575922*ykm2;
    float yd2_actual = xk - 0.862021*ykm1 + 0.21238*ykm2;

    // Discrete - Approximated using 5 fraction bits
    float yd1_approx = xk - 1.125*ykm1 + 0.5625*ykm2;
    float yd2_approx = xk - 0.875*ykm1 + 0.21875*ykm2;
}