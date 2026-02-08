//------------------------------------------------------------------------------
// File        : siso.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : Shift register
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for shift register. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module siso(input clk,si,
            output logic so);

logic [3:0] q;

assign so=q[3];

always_ff @(posedge clk)
q<={q[2:0],si};

endmodule
