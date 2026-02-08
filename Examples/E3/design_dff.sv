//------------------------------------------------------------------------------
// File        : D_ff.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : D Flip Flop
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for the D Flip Flop. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module dff (
    input clk, rst, d,
    output reg q
);
    always_ff @(posedge clk or posedge rst)
        if (rst) q <= 0;
        else     q <= d;
endmodule
