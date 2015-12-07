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
        if ( string_length(InputController.input) == 16 ) {
            thrustdir = string_copy(InputController.input, 11, 6);
            show_debug_message('thrustdir = ' + thrustdir);
        } else {
            thrustdir = '';
        }

        if ( phy_speed < thrustmax ) {
            // Left
            if ( string_char_at(thrustdir, 1) == 'l' ) {    
                physics_apply_force(x, y, thrustpwr * -1, 0);
                // Spray particles right
                part_emitter_region(ParticleController.psystem, ParticleController.pemitright, obj_mech.x + 10, obj_mech.x + 10, obj_mech.y - 10, obj_mech.y - 10, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitright, ParticleController.partright, 1);
            } 
            // Right
            if ( string_char_at(thrustdir, 2) == 'r' ) {    
                physics_apply_force(x, y, thrustpwr, 0); 
                // Spray particles left
                part_emitter_region(ParticleController.psystem, ParticleController.pemitleft, obj_mech.x - 10, obj_mech.x - 10, obj_mech.y - 10, obj_mech.y - 10, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitleft, ParticleController.partleft, 1);
            }
            // Up
            if ( string_char_at(thrustdir, 3) == 'u' ) {    
                physics_apply_force(x, y, 0, thrustpwr * -1); 
                // Spray particles down
                part_emitter_region(ParticleController.psystem, ParticleController.pemitdown, obj_mech.x, obj_mech.x, obj_mech.y + 16, obj_mech.y + 16, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitdown, ParticleController.partdown, 1);
            }
            // Down
            if ( string_char_at(thrustdir, 4) == 'd' ) {    
                physics_apply_force(x, y, 0, thrustpwr); 
                // Spray particles up
                part_emitter_region(ParticleController.psystem, ParticleController.pemitup, obj_mech.x - 5, obj_mech.x - 5, obj_mech.y - 10, obj_mech.y - 10, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitup, ParticleController.partup, 1);
            }
            // Rotate left
            if ( string_char_at(thrustdir, 5) == 'q' ) {    
                rotation -= 0.25; 
                // Spray particles down-right
                part_emitter_region(ParticleController.psystem, ParticleController.pemitdr, obj_mech.x + 5, obj_mech.x + 5, obj_mech.y - 10, obj_mech.y - 10, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitdr, ParticleController.partdr, 1);
            }
            // Rotate right
            if ( string_char_at(thrustdir, 6) == 'e' ) {
                rotation += 0.25;
                // Spray particles down-left
                part_emitter_region(ParticleController.psystem, ParticleController.pemitdl, obj_mech.x - 5, obj_mech.x - 5, obj_mech.y - 10, obj_mech.y - 10, ps_shape_ellipse, ps_distr_linear);
                part_emitter_burst(ParticleController.psystem, ParticleController.pemitdl, ParticleController.partdl, 1);
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
            //falling = true;
            //falltimer = 0;
            statechange(st_mech_idle);
        }
        
        break;
}
