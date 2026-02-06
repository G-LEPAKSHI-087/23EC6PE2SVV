//------------------------------------------------------------------------------
// File        : dual_ram.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-4>
// Module      : dual [port] ram
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple design for the dual port ram. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
module ram(
    input logic clk,we,
    input logic [7:0] addr,wdata,
    output logic [7:0] rdata
);

logic [7:0] mem[256];

always_ff @(posedge clk) begin
    if(we)
        mem[addr] <= wdata;

    rdata <= mem[addr];
end

endmodule
