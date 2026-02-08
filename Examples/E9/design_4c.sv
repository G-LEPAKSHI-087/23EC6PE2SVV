//------------------------------------------------------------------------------
// File        : con_4bit.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : 4-bit counter
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for 4-bit countetr. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module counter(
    input clk,
    input rst,
    output logic [3:0] count
);

always_ff @(posedge clk) begin
    if(rst)
        count <= 0;
    else
        count <= count + 1;
end

endmodule
