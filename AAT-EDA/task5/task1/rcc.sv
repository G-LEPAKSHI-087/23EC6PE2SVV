//------------------------------------------------------------------------------
// File        : rcc.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_and_gate
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple design for ripple carry counter. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Toggle Flip-Flop
module ripple_carry_counter (
    input  logic clk,
    input  logic rst,
    output logic [3:0] count
);

    // Ripple-style increment
    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else begin
            count[0] <= ~count[0];
            count[1] <= count[1] ^ count[0];
            count[2] <= count[2] ^ (count[1] & count[0]);
            count[3] <= count[3] ^ (count[2] & count[1] & count[0]);
        end
    end

endmodule
