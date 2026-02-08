//------------------------------------------------------------------------------
// File        : arb.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : Arbiter
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for Arbiter(Assertions). Randomizes inputs and uses a
//               cover
group to measure input combination coverage.
//------------------------------------------------------------------------------
module arbiter(
    input clk,
    input rst,
    input [3:0] req,
    output logic [3:0] gnt
);

always_ff @(posedge clk) begin

    if(rst)
        gnt <= 4'b0000;

    else begin
        gnt <= 4'b0000; // VERY IMPORTANT (prevents latch behavior)

        if(req[0])      gnt <= 4'b0001;
        else if(req[1]) gnt <= 4'b0010;
        else if(req[2]) gnt <= 4'b0100;
        else if(req[3]) gnt <= 4'b1000;
    end

end

endmodule
