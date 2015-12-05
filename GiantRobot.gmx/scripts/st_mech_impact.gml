var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_impact");
        jumping = false;
        falling = false;
        /*if ( fallingtime < 30 ) {
            show_debug_message('fallingtime is < 30; fall too short for impact');
            statechange(st_mech_idle);
        }*/
        
        phy_speed_x = 0;
        phy_speed_y = 0;
        GameState.control = false; // Remove control
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
