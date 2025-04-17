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
        Y28,
        Y29
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
                Y28,
                Y29;

        wire [15:0] Y [0:29];

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
        assign Y29 = Y[28];

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
        assign w13 = w1 << 6; // w13 = 64x
        assign w14 = w13 - w1; // w14 = 63x
        assign w15 = w3 + w5; // w15 = 11x
        assign w16 = w8 - w3; // w16 = 13x
        assign w17 = w3 + w8; // w17 = 19x
        assign w18 = w4 + w8; // w18 = 21x
        assign w19 = w3 << 3; // w19 = 24x
        assign w20 = w19 - w1; // w20 = 23x
        assign w21 = w1 + w19; // w21 = 25x
        assign w22 = w11 - w4; // w22 = 27x
        assign w23 = w11 - w3; // w23 = 29x
        assign w24 = w3 << 4; // w24 = 48x
        assign w25 = w24 - w3; // w25 = 45x
        assign w26 = w4 + w24; // w26 = 53x
        assign w27 = w6 << 3; // w27 = 56x
        assign w28 = w27 - w1; // w28 = 55x
        assign w29 = w13 - w6; // w29 = 57x
        assign w30 = w13 - w3; // w30 = 61x
        assign w31 = w21 << 1; // w31 = 50x
        assign w32 = w4 << 3; // w32 = 40x
        assign w33 = w10 << 1; // w33 = 34x
        assign w34 = w16 << 1; // w34 = 26x
        assign w35 = w9 << 1; // w35 = 30x
        assign w36 = w6 << 2; // w36 = 28x
        assign w37 = w15 << 1; // w37 = 22x
        assign w38 = w4 << 2; // w38 = 20x
        assign w39 = w7 << 1; // w39 = 18x

        assign Y[0] = w14;
        assign Y[1] = w30;
        assign Y[2] = w29;
        assign Y[3] = w28;
        assign Y[4] = w26;
        assign Y[5] = w31;
        assign Y[6] = w25;
        assign Y[7] = w32;
        assign Y[8] = w33;
        assign Y[9] = w23;
        assign Y[10] = w34;
        assign Y[11] = w17;
        assign Y[12] = w9;
        assign Y[13] = w16;
        assign Y[14] = w5;
        assign Y[15] = w3;
        assign Y[16] = w11;
        assign Y[17] = w12;
        assign Y[18] = w35;
        assign Y[19] = w36;
        assign Y[20] = w22;
        assign Y[21] = w21;
        assign Y[22] = w19;
        assign Y[23] = w20;
        assign Y[24] = w37;
        assign Y[25] = w18;
        assign Y[26] = w38;
        assign Y[27] = w39;
        assign Y[28] = w10;

endmodule //MCM_1

