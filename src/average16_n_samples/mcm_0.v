module MCM_0 (
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
                w7;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = -1 * w3; // w4 = -3x
        assign w5 = w1 << 1; // w5 = 2x
        assign w6 = -1 * w5; // w6 = -2x
        assign w7 = w3 << 2; // w7 = 12x

        assign Y[0] = w4;
        assign Y[1] = w6;
        assign Y[2] = w7;
        assign Y[3] = w2;

endmodule //MCM_0