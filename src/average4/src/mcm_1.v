/*------------------------------------------------------------------------------
 * This code was generated with the help of Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_1 (
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

        wire [15:0] Y [0:15];

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
                w24,
                w25;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w1 + w2; // w3 = 5x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w4 - w1; // w5 = 7x
        assign w6 = w1 << 4; // w6 = 16x
        assign w7 = w1 + w6; // w7 = 17x
        assign w8 = w1 << 5; // w8 = 32x
        assign w9 = w8 - w1; // w9 = 31x
        assign w10 = w6 - w3; // w10 = 11x
        assign w11 = w3 + w4; // w11 = 13x
        assign w12 = w3 << 2; // w12 = 20x
        assign w13 = w12 - w1; // w13 = 19x
        assign w14 = w3 + w6; // w14 = 21x
        assign w15 = w5 + w6; // w15 = 23x
        assign w16 = w8 - w5; // w16 = 25x
        assign w17 = w8 - w3; // w17 = 27x
        assign w18 = w5 << 2; // w18 = 28x
        assign w19 = w1 + w18; // w19 = 29x
        assign w20 = w9 << 1; // w20 = 62x
        assign w21 = w5 << 3; // w21 = 56x
        assign w22 = w11 << 2; // w22 = 52x
        assign w23 = w14 << 1; // w23 = 42x
        assign w24 = w10 << 1; // w24 = 22x
        assign w25 = w5 << 1; // w25 = 14x

        assign Y[0] = w20;
        assign Y[1] = w21;
        assign Y[2] = w22;
        assign Y[3] = w23;
        assign Y[4] = w8;
        assign Y[5] = w24;
        assign Y[6] = w25;
        assign Y[7] = w3;
        assign Y[8] = w9;
        assign Y[9] = w19;
        assign Y[10] = w17;
        assign Y[11] = w16;
        assign Y[12] = w15;
        assign Y[13] = w14;
        assign Y[14] = w13;
        assign Y[15] = w7;

endmodule //MCM_1

