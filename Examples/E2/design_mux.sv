//------------------------------------------------------------------------------
// File        : mux_2x1.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : 2x1 Mux
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design 2x1 Mux . Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module mux2to1 (
    input  logic [7:0] a, b,
    input  logic sel,
    output logic [7:0] y
);
    assign y = sel ? b : a;
endmodule
