`timescale 1ns / 1ps

module automatic_washing_machine_tb;

reg clk;
reg reset;
reg start;
reg door_close;
reg filled;
reg detergent_added;
reg cycle_done;
reg drained;
reg spin_done;

wire door_lock;
wire motor_on;
wire fill_valve_on;
wire drain_valve_on;
wire done;

automatic_washing_machine uut(
    .clk(clk),
    .reset(reset),
    .start(start),
    .door_close(door_close),
    .filled(filled),
    .detergent_added(detergent_added),
    .cycle_done(cycle_done),
    .drained(drained),
    .spin_done(spin_done),
    .door_lock(door_lock),
    .motor_on(motor_on),
    .fill_valve_on(fill_valve_on),
    .drain_valve_on(drain_valve_on),
    .done(done)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    start = 0;
    door_close = 0;
    filled = 0;
    detergent_added = 0;
    cycle_done = 0;
    drained = 0;
    spin_done = 0;

    #10 reset = 0;

    #10 start = 1;
        door_close = 1;

    #20 filled = 1;

    #20 detergent_added = 1;

    #20 cycle_done = 1;

    #20 drained = 1;

    #20 spin_done = 1;

    #20 $finish;
end

endmodule