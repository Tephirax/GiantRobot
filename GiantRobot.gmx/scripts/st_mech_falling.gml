var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_falling");
        jumping = false;
        falling = true;
        fallingtime = 0;
        break;
    case 1: // Action to be performed before state is replaced
        fallingtime = t;
        break;
    case 2: // Action 0 to be performed in Step event
        break;
}
