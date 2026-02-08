//------------------------------------------------------------------------------
// File        : penco.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : priority Encoder
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for the Priority Encoder . Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Code your design here
module priority_enc(input logic [3:0] in,
                    output logic [1:0] out,
                    output logic valid);

always_comb begin
valid=1;

if(in[3]) out=2'b11;
else if(in[2]) out=2'b10;
else if(in[1]) out=2'b01;
else if(in[0]) out=2'b00;
else begin
    out=2'b00;
    valid=0;
end
end
endmodule
