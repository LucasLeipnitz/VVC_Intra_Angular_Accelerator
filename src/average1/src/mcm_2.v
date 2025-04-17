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
        Y28,
        Y29,
        Y30,
        Y31,
        Y32,
        Y33,
        Y34,
        Y35,
        Y36,
        Y37,
        Y38,
        Y39,
        Y40
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
                Y29,
                Y30,
                Y31,
                Y32,
                Y33,
                Y34,
                Y35,
                Y36,
                Y37,
                Y38,
                Y39,
                Y40;

        wire [15:0] Y [0:40];

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
        assign Y30 = Y[29];
        assign Y31 = Y[30];
        assign Y32 = Y[31];
        assign Y33 = Y[32];
        assign Y34 = Y[33];
        assign Y35 = Y[34];
        assign Y36 = Y[35];
        assign Y37 = Y[36];
        assign Y38 = Y[37];
        assign Y39 = Y[38];
        assign Y40 = Y[39];

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
                w39,
                w40,
                w41,
                w42,
                w43,
                w44,
                w45,
                w46,
                w47,
                w48,
                w49,
                w50,
                w51;

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
        assign w13 = w1 + w11; // w13 = 33x
        assign w14 = w1 << 6; // w14 = 64x
        assign w15 = w14 - w1; // w15 = 63x
        assign w16 = w3 + w5; // w16 = 11x
        assign w17 = w8 - w3; // w17 = 13x
        assign w18 = w3 + w8; // w18 = 19x
        assign w19 = w4 + w8; // w19 = 21x
        assign w20 = w3 << 3; // w20 = 24x
        assign w21 = w20 - w1; // w21 = 23x
        assign w22 = w1 + w20; // w22 = 25x
        assign w23 = w11 - w4; // w23 = 27x
        assign w24 = w11 - w3; // w24 = 29x
        assign w25 = w4 << 3; // w25 = 40x
        assign w26 = w25 - w1; // w26 = 39x
        assign w27 = w3 << 4; // w27 = 48x
        assign w28 = w1 + w27; // w28 = 49x
        assign w29 = w4 + w27; // w29 = 53x
        assign w30 = w6 << 3; // w30 = 56x
        assign w31 = w30 - w1; // w31 = 55x
        assign w32 = w14 - w6; // w32 = 57x
        assign w33 = w1 << 1; // w33 = 2x
        assign w34 = w4 << 1; // w34 = 10x
        assign w35 = w3 << 2; // w35 = 12x
        assign w36 = w6 << 1; // w36 = 14x
        assign w37 = w7 << 1; // w37 = 18x
        assign w38 = w4 << 2; // w38 = 20x
        assign w39 = w6 << 2; // w39 = 28x
        assign w40 = w9 << 1; // w40 = 30x
        assign w41 = w7 << 2; // w41 = 36x
        assign w42 = w19 << 1; // w42 = 42x
        assign w43 = w16 << 2; // w43 = 44x
        assign w44 = w21 << 1; // w44 = 46x
        assign w45 = w17 << 2; // w45 = 52x
        assign w46 = w23 << 1; // w46 = 54x
        assign w47 = w24 << 1; // w47 = 58x
        assign w48 = w9 << 2; // w48 = 60x
        assign w49 = w12 << 1; // w49 = 62x
        assign w50 = w16 << 1; // w50 = 22x
        assign w51 = w17 << 1; // w51 = 26x

        assign Y[0] = w33;
        assign Y[1] = w2;
        assign Y[2] = w6;
        assign Y[3] = w34;
        assign Y[4] = w35;
        assign Y[5] = w36;
        assign Y[6] = w9;
        assign Y[7] = w8;
        assign Y[8] = w37;
        assign Y[9] = w38;
        assign Y[10] = w20;
        assign Y[11] = w39;
        assign Y[12] = w24;
        assign Y[13] = w40;
        assign Y[14] = w13;
        assign Y[15] = w41;
        assign Y[16] = w26;
        assign Y[17] = w42;
        assign Y[18] = w43;
        assign Y[19] = w44;
        assign Y[20] = w28;
        assign Y[21] = w45;
        assign Y[22] = w29;
        assign Y[23] = w46;
        assign Y[24] = w31;
        assign Y[25] = w30;
        assign Y[26] = w32;
        assign Y[27] = w47;
        assign Y[28] = w48;
        assign Y[29] = w49;
        assign Y[30] = w15;
        assign Y[31] = w10;
        assign Y[32] = w18;
        assign Y[33] = w19;
        assign Y[34] = w50;
        assign Y[35] = w21;
        assign Y[36] = w22;
        assign Y[37] = w51;
        assign Y[38] = w23;
        assign Y[39] = w12;

endmodule //MCM_2

