var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_idle");
        InputController.input = '';
        break;
    case 1: // Action to be performed before state is replaced
        break;
    case 2: // Action 0 to be performed in Step event
        if ( jumping ) {
            jumptimer += 1;
            physics_apply_impulse(x, y, 0, jumppwr + (jumptimer * jumpratio));
            if ( jumptimer == jumptime ) {
                jumping = false;
                falling = true;
                falltimer = 0;
            }
        }
        
        if ( hovering ) {
            if ( keyboard_check_released(vk_space) ) {
                canhover = false;
                hovering = false;
                falling = true;
                falltimer = 0;
            } else {
                hovertimer += 1;
                physics_apply_impulse(x, y, 0, hoverpwr);
                if ( hovertimer == hovertime ) {
                    canhover = false;
                    hovering = false;
                    falling = true;
                    falltimer = 0;
                }
            }
        }
        
        if ( falling ) {
            falltimer += 1;
        }
        
        // If platform is no longer beneath mech, set falling
        if ( !falling && !jumping && raydown < 0 && raydownleft < 0 && raydownright < 0 ) {
            canhover = true;
            falling = true;
            falltimer = 0;
        }
        
        break;
}
