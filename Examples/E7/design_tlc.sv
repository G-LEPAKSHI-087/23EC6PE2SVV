//------------------------------------------------------------------------------
// File        : tlc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : Traffic light controller
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for the Traffic. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
typedef enum {RED,GREEN,YELLOW} light_t;

module traffic(input clk,rst,
               output light_t color);

always_ff @(posedge clk) begin
if(rst) color<=RED;
else case(color)
RED: color<=GREEN;
GREEN: color<=YELLOW;
YELLOW: color<=RED;
endcase
end

endmodule
