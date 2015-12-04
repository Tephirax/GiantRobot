var t; // time
t = argument1;
switch(argument0)
{
    case 0: // Action to be performed upon state initialisation
        show_debug_message("obj_mech changes state to st_mech_thrust");
        break;
    case 1: // Action to be performed before state is replaced
        break;
    case 2: // Action 0 to be performed in Step event
        if ( string_length(InputController.input) == 14 ) {
            thrustdir = string_copy(InputController.input, 11, 4);
            show_debug_message('thrustdir = ' + thrustdir);
        } else {
            thrustdir = '';
        }

        if ( phy_speed < thrustmax ) {
            if ( string_char_at(thrustdir, 1) == 'l' ) {    
                physics_apply_force(x, y, thrustpwr * -1, 0); 
            } 
            if ( string_char_at(thrustdir, 2) == 'r' ) {    
                physics_apply_force(x, y, thrustpwr, 0); 
            }
            if ( string_char_at(thrustdir, 3) == 'u' ) {    
                physics_apply_force(x, y, 0, thrustpwr * -1); 
            }
            if ( string_char_at(thrustdir, 4) == 'd' ) {    
                physics_apply_force(x, y, 0, thrustpwr); 
            }
        }
        
        // Flip sprite direction if travelling left
        if ( image_xscale = 1 && phy_speed_x < -0.2 ) {
            image_xscale = -1;
        }
        else if ( image_xscale = -1 && phy_speed_x > 0.2 ) {
            image_xscale = 1;
        }
        
        // Lock rotation
        phy_fixed_rotation = true;
        phy_rotation = rotation;
        
        // If gravity activated in this state, switch to falling state
        if ( gravityActive ) {
            show_debug_message('Gravity activated whilst in state st_mech_thrust');
            statechange(st_mech_falling);
        }
        
        break;
}
