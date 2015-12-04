var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_left");
        image_xscale = -1;
        break;
    case 1: // Action to be performed before state is replaced
        InputController.input = '';
        break;
    case 2: // Action 0 to be performed in Step event
        phy_position_x -= walkspeed;
        image_speed = 0.2;
        break;
}
