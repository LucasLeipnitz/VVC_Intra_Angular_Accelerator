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
                w9;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 << 4; // w4 = 16x
        assign w5 = w3 + w4; // w5 = 19x
        assign w6 = w3 << 3; // w6 = 24x
        assign w7 = w3 + w6; // w7 = 27x
        assign w8 = w3 << 4; // w8 = 48x
        assign w9 = w3 + w8; // w9 = 51x

        assign Y[0] = w4;
        assign Y[1] = w9;
        assign Y[2] = w5;
        assign Y[3] = w7;

endmodule //MCM_2

