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
        Y15,
        Y16,
        Y17,
        Y18,
        Y19,
        Y20,
        Y21,
        Y22,
        Y23,
        Y24,
        Y25,
        Y26,
        Y27,
        Y28
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
                Y21,
                Y22,
                Y23,
                Y24,
                Y25,
                Y26,
                Y27,
                Y28;

        wire [15:0] Y [0:28];

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
        assign Y22 = Y[21];
        assign Y23 = Y[22];
        assign Y24 = Y[23];
        assign Y25 = Y[24];
        assign Y26 = Y[25];
        assign Y27 = Y[26];
        assign Y28 = Y[27];

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
                w26,
                w27,
                w28,
                w29,
                w30,
                w31,
                w32,
                w33,
                w34,
                w35,
                w36,
                w37,
                w38,
                w39;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 + w5; // w7 = 9x
        assign w8 = w1 << 4; // w8 = 16x
        assign w9 = w8 - w1; // w9 = 15x
        assign w10 = w1 + w8; // w10 = 17x
        assign w11 = w1 << 5; // w11 = 32x
        assign w12 = w11 - w1; // w12 = 31x
        assign w13 = w3 + w5; // w13 = 11x
        assign w14 = w8 - w3; // w14 = 13x
        assign w15 = w3 + w8; // w15 = 19x
        assign w16 = w4 + w8; // w16 = 21x
        assign w17 = w3 << 3; // w17 = 24x
        assign w18 = w17 - w1; // w18 = 23x
        assign w19 = w1 + w17; // w19 = 25x
        assign w20 = w11 - w4; // w20 = 27x
        assign w21 = w11 - w3; // w21 = 29x
        assign w22 = w4 + w11; // w22 = 37x
        assign w23 = w3 << 4; // w23 = 48x
        assign w24 = w23 - w4; // w24 = 43x
        assign w25 = w23 - w1; // w25 = 47x
        assign w26 = w1 << 6; // w26 = 64x
        assign w27 = w26 - w4; // w27 = 59x
        assign w28 = w1; // w28 = 1x
        assign w29 = w6 << 1; // w29 = 14x
        assign w30 = w13 << 1; // w30 = 22x
        assign w31 = w6 << 2; // w31 = 28x
        assign w32 = w14 << 2; // w32 = 52x
        assign w33 = w20 << 1; // w33 = 54x
        assign w34 = w6 << 3; // w34 = 56x
        assign w35 = w12 << 1; // w35 = 62x
        assign w36 = w7 << 1; // w36 = 18x
        assign w37 = w4 << 2; // w37 = 20x
        assign w38 = w14 << 1; // w38 = 26x
        assign w39 = w9 << 1; // w39 = 30x

        assign Y[0] = w28;
        assign Y[1] = w4;
        assign Y[2] = w13;
        assign Y[3] = w29;
        assign Y[4] = w10;
        assign Y[5] = w30;
        assign Y[6] = w31;
        assign Y[7] = w12;
        assign Y[8] = w22;
        assign Y[9] = w24;
        assign Y[10] = w25;
        assign Y[11] = w32;
        assign Y[12] = w33;
        assign Y[13] = w34;
        assign Y[14] = w27;
        assign Y[15] = w35;
        assign Y[16] = w8;
        assign Y[17] = w36;
        assign Y[18] = w15;
        assign Y[19] = w37;
        assign Y[20] = w16;
        assign Y[21] = w18;
        assign Y[22] = w17;
        assign Y[23] = w19;
        assign Y[24] = w38;
        assign Y[25] = w20;
        assign Y[26] = w21;
        assign Y[27] = w39;

endmodule //MCM_2

