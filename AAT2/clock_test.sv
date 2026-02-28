program clock_test(clock_interface.TB intf);

    // Functional Coverage
    covergroup cg @(posedge intf.clk);

        coverpoint intf.seconds {
            bins sec_vals[] = {[0:59]};
            bins sec_roll = (59 => 0);
        }

        coverpoint intf.minutes {
            bins min_vals[] = {[0:59]};
            bins min_roll = (59 => 0);
        }

        cross intf.seconds, intf.minutes;

    endgroup

    cg c = new();

    initial begin
        // Apply reset
        intf.rst = 1;
        repeat (5) @(posedge intf.clk);
        intf.rst = 0;

        // Run simulation
        repeat (4000) @(posedge intf.clk);

        $display("TEST COMPLETED");
        $finish;
    end

endprogram

