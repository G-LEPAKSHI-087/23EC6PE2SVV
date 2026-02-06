//------------------------------------------------------------------------------
// File        : tb_pwm.sv
// Author      : <G Lepakshi /1BM23EC087 >
// Created     : <2026-01-30>
// Module      : tb_pwm
// Project     : SystemVerilog and Verification (23EC6PE2SV),
//               Faculty: Prof. Ajaykumar Devarapalli
//
// Description : Simple Design for PWM. Randomizes inputs and uses a
//               covergroup to measure input combination coverage.
//------------------------------------------------------------------------------
// Code your design here
module pwm(input logic clk, rst,
           input logic [7:0] duty,
           output logic pwm_out);
    logic [7:0] cnt;

    always_ff @(posedge clk)
        if (rst) cnt <= 0;
        else cnt <= cnt + 1;

    assign pwm_out = (cnt < duty);
endmodule
