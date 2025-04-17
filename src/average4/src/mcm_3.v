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

        wire [15:0] Y [0:11];

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
                w16;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 << 1; // w7 = 2x
        assign w8 = -1 * w7; // w8 = -2x
        assign w9 = -1 * w2; // w9 = -4x
        assign w10 = -1 * w4; // w10 = -5x
        assign w11 = -1 * w3; // w11 = -3x
        assign w12 = -1 * w1; // w12 = -1x
        assign w13 = w3 << 1; // w13 = 6x
        assign w14 = w4 << 1; // w14 = 10x
        assign w15 = w3 << 2; // w15 = 12x
        assign w16 = w6 << 1; // w16 = 14x

        assign Y[0] = w8;
        assign Y[1] = w9;
        assign Y[2] = w10;
        assign Y[3] = w11;
        assign Y[4] = w12;
        assign Y[5] = w7;
        assign Y[6] = w2;
        assign Y[7] = w13;
        assign Y[8] = w5;
        assign Y[9] = w14;
        assign Y[10] = w15;
        assign Y[11] = w16;

endmodule //MCM_3

