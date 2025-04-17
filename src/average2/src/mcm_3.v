/*------------------------------------------------------------------------------
 * This code was generated with the help of Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

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
        Y16,
        Y17,
        Y18,
        Y19,
        Y20,
        Y21
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
                Y16,
                Y17,
                Y18,
                Y19,
                Y20,
                Y21;

        wire [15:0] Y [0:21];

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
        assign Y17 = Y[16];
        assign Y18 = Y[17];
        assign Y19 = Y[18];
        assign Y20 = Y[19];
        assign Y21 = Y[20];

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
                w23;

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
        assign w12 = w1 << 1; // w12 = 2x
        assign w13 = -1 * w12; // w13 = -2x
        assign w14 = -1 * w2; // w14 = -4x
        assign w15 = w3 << 1; // w15 = 6x
        assign w16 = -1 * w15; // w16 = -6x
        assign w17 = -1 * w4; // w17 = -5x
        assign w18 = -1 * w3; // w18 = -3x
        assign w19 = -1 * w1; // w19 = -1x
        assign w20 = w1; // w20 = 1x
        assign w21 = w4 << 1; // w21 = 10x
        assign w22 = w3 << 2; // w22 = 12x
        assign w23 = w6 << 1; // w23 = 14x

        assign Y[0] = w13;
        assign Y[1] = w14;
        assign Y[2] = w16;
        assign Y[3] = w17;
        assign Y[4] = w18;
        assign Y[5] = w19;
        assign Y[6] = w20;
        assign Y[7] = w12;
        assign Y[8] = w3;
        assign Y[9] = w2;
        assign Y[10] = w4;
        assign Y[11] = w15;
        assign Y[12] = w6;
        assign Y[13] = w5;
        assign Y[14] = w7;
        assign Y[15] = w21;
        assign Y[16] = w10;
        assign Y[17] = w22;
        assign Y[18] = w11;
        assign Y[19] = w23;
        assign Y[20] = w9;

endmodule //MCM_3

