module MCM_1 (
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
                w14,
                w15,
                w16;

        assign w1 = X;
        assign w2 = w1 << 2; // w2 = 4x
        assign w3 = w2 - w1; // w3 = 3x
        assign w4 = w1 + w2; // w4 = 5x
        assign w5 = w1 << 3; // w5 = 8x
        assign w6 = w5 - w1; // w6 = 7x
        assign w7 = w1 + w5; // w7 = 9x
        assign w8 = w3 << 4; // w8 = 48x
        assign w9 = w4 + w8; // w9 = 53x
        assign w10 = -1 * w3; // w10 = -3x
        assign w11 = w1 << 1; // w11 = 2x
        assign w12 = -1 * w11; // w12 = -2x
        assign w13 = w3 << 2; // w13 = 12x
        assign w14 = w7 << 1; // w14 = 18x
        assign w15 = w6 << 2; // w15 = 28x
        assign w16 = w4 << 2; // w16 = 20x

        assign Y[0] = w10;
        assign Y[1] = w12;
        assign Y[2] = w13;
        assign Y[3] = w2;
        assign Y[4] = w9;
        assign Y[5] = w14;
        assign Y[6] = w15;
        assign Y[7] = w16;

endmodule //MCM_1