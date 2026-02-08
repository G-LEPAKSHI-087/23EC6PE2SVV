//------------------------------------------------------------------------------
// File        : and.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple design for the AND gate. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Code your design here
module and_gate (
    input  logic a, b,
    output logic y
);
    assign y = a & b;
endmodule
