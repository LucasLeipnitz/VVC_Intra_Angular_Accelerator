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
        Y4
);

        // Port mode declarations:
        input  unsigned  [7:0] X;
        output signed  [15:0]
                Y1,
                Y2,
                Y3,
                Y4;

        wire [15:0] Y [0:3];

        assign Y1 = Y[0];
        assign Y2 = Y[1];
        assign Y3 = Y[2];
        assign Y4 = Y[3];

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
                w13;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w1 + w2; // w3 = 5x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w4 - w1; // w5 = 7x
        assign w6 = w1 + w4; // w6 = 9x
        assign w7 = w5 << 4; // w7 = 112x
        assign w8 = w1 + w7; // w8 = 113x
        assign w9 = w8 - w5; // w9 = 106x
        assign w10 = w9 >> 1; // w10 = 53x
        assign w11 = w6 << 1; // w11 = 18x
        assign w12 = w5 << 2; // w12 = 28x
        assign w13 = w3 << 2; // w13 = 20x

        assign Y[0] = w10;
        assign Y[1] = w11;
        assign Y[2] = w12;
        assign Y[3] = w13;

endmodule //MCM_1

