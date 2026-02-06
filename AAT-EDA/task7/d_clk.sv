//------------------------------------------------------------------------------
// File        : digital_clock.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-04>
// Module      : digital clock
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple testbench for Digital clock. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module digital_clock(
    input logic clk,rst,
    output logic [5:0] sec,min
);

always_ff @(posedge clk or posedge rst) begin
    if(rst) begin
        sec<=0;
        min<=0;
    end
    else if(sec==59) begin
        sec<=0;
        min <= (min==59)?0:min+1;
    end
    else
        sec<=sec+1;
end

endmodule
