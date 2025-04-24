module MCM_4 (
        X,
        Y1,
        Y2,
        Y3,
        Y4,
        Y5,
        Y6,
        Y7,
        Y8,
        Y9,
        Y10,
        Y11,
        Y12
);

        // Port mode declarations:
        input  unsigned  [7:0] X;
        output signed  [15:0]
                Y1,
                Y2,
                Y3,
                Y4,
                Y5,
                Y6,
                Y7,
                Y8,
                Y9,
                Y10,
                Y11,
                Y12;

        wire [15:0] Y [0:12];

        assign Y1 = Y[0];
        assign Y2 = Y[1];
        assign Y3 = Y[2];
        assign Y4 = Y[3];
        assign Y5 = Y[4];
        assign Y6 = Y[5];
        assign Y7 = Y[6];
        assign Y8 = Y[7];
        assign Y9 = Y[8];
        assign Y10 = Y[9];
        assign Y11 = Y[10];
        assign Y12 = Y[11];

        //Multipliers:

        wire signed [15:0]
                w1,
                w2,
                w3,
                w4,
                w5,
                w6,
                w7,
                w8,
                w9,
                w10,
                w11,
                w12,
                w13,
                w14,
                w15,
                w16,
                w17,
                w18,
                w19,
                w20,
                w21;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 + w5; // w7 = 9x
        assign w8 = w3 + w5; // w8 = 11x
        assign w9 = w1 << 4; // w9 = 16x
        assign w10 = w3 + w9; // w10 = 19x
        assign w11 = w1 << 5; // w11 = 32x
        assign w12 = w11 - w4; // w12 = 27x
        assign w13 = w3 << 4; // w13 = 48x
        assign w14 = w3 + w13; // w14 = 51x
        assign w15 = w4 + w13; // w15 = 53x
        assign w16 = w7 << 1; // w16 = 18x
        assign w17 = w6 << 2; // w17 = 28x
        assign w18 = w4 << 2; // w18 = 20x
        assign w19 = w1 << 1; // w19 = 2x
        assign w20 = -1 * w19; // w20 = -2x
        assign w21 = -1 * w3; // w21 = -3x

        assign Y[0] = w15;
        assign Y[1] = w16;
        assign Y[2] = w17;
        assign Y[3] = w18;
        assign Y[4] = w9;
        assign Y[5] = w14;
        assign Y[6] = w10;
        assign Y[7] = w12;
        assign Y[8] = w20;
        assign Y[9] = w21;
        assign Y[10] = w3;
        assign Y[11] = w8;

endmodule //MCM_4