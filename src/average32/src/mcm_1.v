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
                w7;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w1 + w4; // w5 = 9x
        assign w6 = w5 << 2; // w6 = 36x
        assign w7 = w3 << 3; // w7 = 24x

        assign Y[0] = w6;
        assign Y[1] = w7;

endmodule //MCM_1

