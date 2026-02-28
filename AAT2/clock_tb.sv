module clock_tb;

    logic clk = 0;

    // Clock generation
    always #5 clk = ~clk;

    // Interface
    clock_interface intf(clk);

    // DUT
    digital_clock dut (
        .clk(clk),
        .rst(intf.rst),
        .seconds(intf.seconds),
        .minutes(intf.minutes)
    );

    // --------------------------------
    // VCD Dump
    // --------------------------------
    initial begin
        $dumpfile("digital_clock.vcd");
        $dumpvars(0, clock_tb);
    end

    // --------------------------------
    // Assertions (ignore X values)
    // --------------------------------
    always @(posedge clk) begin
        if (!$isunknown(intf.seconds))
            assert(intf.seconds <= 59)
            else $error("Seconds exceeded 59!");

        if (!$isunknown(intf.minutes))
            assert(intf.minutes <= 59)
            else $error("Minutes exceeded 59!");
    end

    // Program
    clock_test test(intf);

endmodule

