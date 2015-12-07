var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_thrust_idle");
        InputController.input = '';
        break;
    case 1: // Action to be performed before state is replaced
        break;
    case 2: // Action 0 to be performed in Step event
        // If gravity activated in this state, switch to falling state
        if ( gravityActive ) {
            show_debug_message('Gravity activated whilst in state st_mech_thrust_idle');
            //falling = true;
            //falltimer = 0;
            statechange(st_mech_idle);
        }
        break;
}
