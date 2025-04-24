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

        wire [15:0] Y [0:4];

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
                w8;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 << 3; // w4 = 8x
        assign w5 = w1 + w4; // w5 = 9x
        assign w6 = -1 * w3; // w6 = -3x
        assign w7 = w5 << 2; // w7 = 36x
        assign w8 = w3 << 3; // w8 = 24x

        assign Y[0] = w6;
        assign Y[1] = w4;
        assign Y[2] = w7;
        assign Y[3] = w8;

endmodule //MCM_1