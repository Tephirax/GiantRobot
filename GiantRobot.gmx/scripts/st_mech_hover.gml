var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_hover");
        break;
    case 1: // Action to be performed before state is replaced
        break;
    case 2: // Action 0 to be performed in Step event
        physics_apply_impulse(x, y, 0, hoverpwr);
        break;
}
