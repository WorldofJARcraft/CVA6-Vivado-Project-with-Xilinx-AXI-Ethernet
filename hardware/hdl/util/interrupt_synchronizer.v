module interrupt_synchronizer(
    input wire source_clock,
    input wire target_clock,
    (*X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 source_resetn RST", X_INTERFACE_PARAMETER="POLARITY ACTIVE_LOW"*)
    input wire source_resetn,
    (*X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 target_resetn RST", X_INTERFACE_PARAMETER="POLARITY ACTIVE_LOW"*) 
    input wire target_resetn,
    input wire irq_in,
    output reg irq_out
);
    // register for source clock domain
    reg irq_q;

    // 2FF synchronizer
    reg irq_q1;
    reg irq_q2;

    always@(posedge(source_clock), negedge(source_resetn))
    begin
        if(source_resetn == 0)
        begin
            irq_q <= 0;
        end
        else
        begin
            irq_q <= irq_in;
        end
    end

    always@(posedge(target_clock), negedge(target_resetn))
    begin
        if(target_resetn == 0)
        begin
            irq_q1 <= 0;
            irq_q2 <= 0;
            irq_out <= 0;
        end
        else
        begin
            {irq_q1, irq_q2, irq_out} <= {irq_q, irq_q1, irq_q2};
        end
    end

    

endmodule