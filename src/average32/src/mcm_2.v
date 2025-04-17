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
        Y2
);

        // Port mode declarations:
        input  unsigned  [7:0] X;
        output signed  [15:0]
                Y1,
                Y2;

        wire [15:0] Y [0:1];

        assign Y1 = Y[0];
        assign Y2 = Y[1];

        //Multipliers:

        wire signed [15:0]
                w1,
                w2,
                w3,
                w4,
                w5,
                w6,
                w7,
                w8;

        assign w1 = X;
        assign w2 = w1 << 4; // w2 = 16x
        assign w3 = w1 + w2; // w3 = 17x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w3 + w4; // w5 = 25x
        assign w6 = w1 << 1; // w6 = 2x
        assign w7 = w5 - w6; // w7 = 23x
        assign w8 = w3 << 1; // w8 = 34x

        assign Y[0] = w8;
        assign Y[1] = w7;

endmodule //MCM_2

