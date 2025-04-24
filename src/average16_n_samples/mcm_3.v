module MCM_3 (
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
        Y12,
        Y13,
        Y14,
        Y15,
        Y16
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
                Y12,
                Y13,
                Y14,
                Y15,
                Y16;

        wire [15:0] Y [0:16];

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
        assign Y13 = Y[12];
        assign Y14 = Y[13];
        assign Y15 = Y[14];
        assign Y16 = Y[15];

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
                w21,
                w22,
                w23,
                w24;

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
        assign w16 = -1 * w3; // w16 = -3x
        assign w17 = w1 << 1; // w17 = 2x
        assign w18 = -1 * w17; // w18 = -2x
        assign w19 = w3 << 2; // w19 = 12x
        assign w20 = w7 << 1; // w20 = 18x
        assign w21 = w6 << 2; // w21 = 28x
        assign w22 = w4 << 2; // w22 = 20x
        assign w23 = w18; // w23 = -2x
        assign w24 = w16; // w24 = -3x

        assign Y[0] = w16;
        assign Y[1] = w18;
        assign Y[2] = w19;
        assign Y[3] = w2;
        assign Y[4] = w15;
        assign Y[5] = w20;
        assign Y[6] = w21;
        assign Y[7] = w22;
        assign Y[8] = w9;
        assign Y[9] = w14;
        assign Y[10] = w10;
        assign Y[11] = w12;
        assign Y[12] = w23;
        assign Y[13] = w24;
        assign Y[14] = w3;
        assign Y[15] = w8;

endmodule //MCM_3