module MCM_4 (
        X,
        Y1,
        Y2,
        Y3,
        Y4,
        Y5,
        Y6
);

        // Port mode declarations:
        input  unsigned  [7:0] X;
        output signed  [15:0]
                Y1,
                Y2,
                Y3,
                Y4,
                Y5,
                Y6;

        wire [15:0] Y [0:6];

        assign Y1 = Y[0];
        assign Y2 = Y[1];
        assign Y3 = Y[2];
        assign Y4 = Y[3];
        assign Y5 = Y[4];
        assign Y6 = Y[5];

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
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w4 - w1; // w5 = 7x
        assign w6 = w1 + w4; // w6 = 9x
        assign w7 = w1 << 4; // w7 = 16x
        assign w8 = w1 + w7; // w8 = 17x
        assign w9 = w3 << 3; // w9 = 24x
        assign w10 = w9 - w1; // w10 = 23x
        assign w11 = w6 << 2; // w11 = 36x
        assign w12 = w8 << 1; // w12 = 34x
        assign w13 = -1 * w3; // w13 = -3x

        assign Y[0] = w11;
        assign Y[1] = w9;
        assign Y[2] = w12;
        assign Y[3] = w10;
        assign Y[4] = w13;
        assign Y[5] = w5;

endmodule //MCM_4