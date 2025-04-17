/*------------------------------------------------------------------------------
 * This code was generated with the help of Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_2 (
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
        Y15
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
                Y15;

        wire [15:0] Y [0:14];

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
                w24,
                w25,
                w26;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 + w5; // w7 = 9x
        assign w8 = w1 << 4; // w8 = 16x
        assign w9 = w8 - w1; // w9 = 15x
        assign w10 = w3 + w5; // w10 = 11x
        assign w11 = w8 - w3; // w11 = 13x
        assign w12 = w3 + w8; // w12 = 19x
        assign w13 = w3 << 3; // w13 = 24x
        assign w14 = w1 + w13; // w14 = 25x
        assign w15 = w6 << 3; // w15 = 56x
        assign w16 = w15 - w1; // w16 = 55x
        assign w17 = w3 << 2; // w17 = 12x
        assign w18 = w9 << 1; // w18 = 30x
        assign w19 = w4 << 3; // w19 = 40x
        assign w20 = w14 << 1; // w20 = 50x
        assign w21 = w9 << 2; // w21 = 60x
        assign w22 = w7 << 1; // w22 = 18x
        assign w23 = w4 << 2; // w23 = 20x
        assign w24 = w10 << 1; // w24 = 22x
        assign w25 = w11 << 1; // w25 = 26x
        assign w26 = w6 << 2; // w26 = 28x

        assign Y[0] = w3;
        assign Y[1] = w17;
        assign Y[2] = w12;
        assign Y[3] = w18;
        assign Y[4] = w19;
        assign Y[5] = w20;
        assign Y[6] = w16;
        assign Y[7] = w21;
        assign Y[8] = w8;
        assign Y[9] = w22;
        assign Y[10] = w23;
        assign Y[11] = w24;
        assign Y[12] = w13;
        assign Y[13] = w25;
        assign Y[14] = w26;

endmodule //MCM_2

