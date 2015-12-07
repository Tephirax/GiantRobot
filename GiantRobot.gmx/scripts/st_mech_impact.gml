var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_impact");
        jumping = false;
        hovering = false;
        canhover = false;
        falling = false;
        // If fall isn't far enough to cause impact, go to idle state
        if ( falltimer < impactmin ) {
            show_debug_message('fallingtime is < 30; fall too short for impact');
            GameState.control = true;
            statechange(st_mech_idle);
        } else { // Otherwise, go to impact recovery
            phy_speed_x = 0;
            phy_speed_y = 0;
            GameState.control = false; // Remove control
            // TODO: Play recovery animation
        }
        break;
    case 1: // Action to be performed before state is replaced
        GameState.control = true; // Restore control
        break;
    case 2: // Action 0 to be performed in Step event
        // After half a second, reenable controls
        if ( t == impacttime ) {
            statechange(st_mech_idle);
        }        
        break;
}
