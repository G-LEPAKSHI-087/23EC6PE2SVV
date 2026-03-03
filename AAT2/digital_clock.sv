//------------------------------------------------------------------------------
// File        : digital_clock.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-03-1>
// Module      : Design module
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Basic Digital Clock used for basic functional coverage example and uses a
//               covergroup to measure input combination coverage.

module digital_clock (
    input  logic clk,
    input  logic rst,          // Active-high synchronous reset
    output logic [5:0] seconds,
    output logic [5:0] minutes
);

    always_ff @(posedge clk) begin
        if (rst) begin
            seconds <= 6'd0;
            minutes <= 6'd0;
        end
        else begin
            if (seconds == 6'd59) begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 1;
            end
            else begin
                seconds <= seconds + 1;
            end
        end
    end

endmodule

