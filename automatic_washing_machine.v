`timescale 1ns / 1ps

module automatic_washing_machine(

    input clk,
    input reset,

    input start,
    input door_close,
    input filled,
    input detergent_added,
    input cycle_done,
    input drained,
    input spin_done,

    output reg door_lock,
    output reg motor_on,
    output reg fill_valve_on,
    output reg drain_valve_on,
    output reg done

);

parameter CHECK_DOOR    = 3'b000;
parameter FILL_WATER    = 3'b001;
parameter ADD_DETERGENT = 3'b010;
parameter WASH          = 3'b011;
parameter DRAIN_WATER   = 3'b100;
parameter SPIN          = 3'b101;
parameter FINISH        = 3'b110;

reg [2:0] current_state;
reg [2:0] next_state;

always @(posedge clk or posedge reset)
begin
    if(reset)
        current_state <= CHECK_DOOR;
    else
        current_state <= next_state;
end

always @(*)
begin
    next_state = current_state;

    case(current_state)

        CHECK_DOOR:
        begin
            if(start && door_close)
                next_state = FILL_WATER;
        end

        FILL_WATER:
        begin
            if(filled)
                next_state = ADD_DETERGENT;
        end

        ADD_DETERGENT:
        begin
            if(detergent_added)
                next_state = WASH;
        end

        WASH:
        begin
            if(cycle_done)
                next_state = DRAIN_WATER;
        end

        DRAIN_WATER:
        begin
            if(drained)
                next_state = SPIN;
        end

        SPIN:
        begin
            if(spin_done)
                next_state = FINISH;
        end

        FINISH:
        begin
            next_state = CHECK_DOOR;
        end

        default:
            next_state = CHECK_DOOR;

    endcase
end

always @(*)
begin

    door_lock      = 0;
    motor_on       = 0;
    fill_valve_on  = 0;
    drain_valve_on = 0;
    done           = 0;

    case(current_state)

        CHECK_DOOR:
        begin
            door_lock = 0;
        end

        FILL_WATER:
        begin
            door_lock = 1;
            fill_valve_on = 1;
        end

        ADD_DETERGENT:
        begin
            door_lock = 1;
        end

        WASH:
        begin
            door_lock = 1;
            motor_on = 1;
        end

        DRAIN_WATER:
        begin
            door_lock = 1;
            drain_valve_on = 1;
        end

        SPIN:
        begin
            door_lock = 1;
            motor_on = 1;
        end

        FINISH:
        begin
            done = 1;
        end

    endcase

end

endmodule
