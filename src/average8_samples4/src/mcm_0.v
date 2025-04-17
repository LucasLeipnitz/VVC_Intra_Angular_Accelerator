/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_0 (
        X,
        Y1,
        Y2,
        Y3,
        Y4,
        Y5,
        Y6,
        Y7,
        Y8
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
                Y8;

        wire [15:0] Y [0:8];

        assign Y1 = Y[0];
        assign Y2 = Y[1];
        assign Y3 = Y[2];
        assign Y4 = Y[3];
        assign Y5 = Y[4];
        assign Y6 = Y[5];
        assign Y7 = Y[6];
        assign Y8 = Y[7];

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
                w14;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 << 1; // w7 = 2x
        assign w8 = -1 * w7; // w8 = -2x
        assign w9 = -1 * w4; // w9 = -5x
        assign w10 = -1 * w3; // w10 = -3x
        assign w11 = -1 * w1; // w11 = -1x
        assign w12 = w6 << 1; // w12 = 14x
        assign w13 = w4 << 1; // w13 = 10x
        assign w14 = w3 << 1; // w14 = 6x

        assign Y[0] = w8;
        assign Y[1] = w9;
        assign Y[2] = w10;
        assign Y[3] = w11;
        assign Y[4] = w12;
        assign Y[5] = w13;
        assign Y[6] = w14;
        assign Y[7] = w7;

endmodule //MCM_0

