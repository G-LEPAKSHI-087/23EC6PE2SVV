//------------------------------------------------------------------------------
// File        : fifo.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-06>
// Module      : FIFO
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for the FIFO. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module fifo(input clk,wr,rd,
            input [7:0] din,
            output logic full,empty);

logic [4:0] cnt=0;

assign full=(cnt==16);
assign empty=(cnt==0);

always_ff @(posedge clk) begin
if(wr && !full) cnt++;
if(rd && !empty) cnt--;
end

endmodule
