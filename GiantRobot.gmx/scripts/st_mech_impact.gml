var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_impact");
        GameState.control = false; // Remove control
        jumping = false;
        falling = false;
        phy_speed_x = 0;
        phy_speed_y = 0;
        // TODO: Play recovery animation
        break;
    case 1: // Action to be performed before state is replaced
        GameState.control = true; // Restore control
        break;
    case 2: // Action 0 to be performed in Step event
        // After half a second, reenable controls
        if ( t == 30 ) {
            statechange(st_mech_idle);
        }        
        break;
}
