var x1, y1, map;

grid_w = floor(room_width / 32)
grid_h = floor(room_height / 32);
grid_data[0, 0] = 0;   // This array holds our "map"

x1 = 0;
y1 = 0;

// Populate map as currently exists
repeat (grid_h) {
    repeat (grid_w) {
        if ( position_meeting(32 * x1, 32 * y1, obj_wall ) ) {
            grid_data[x1, y1] = 1;
        }
        else if ( position_meeting(32 * x1, 32 * y1, obj_door) ) {
            var thisdoor = instance_position(32 * x1, 32 * y1, obj_door);
            // If door is closed, count as a wall
            if ( !thisdoor.open ) {
                grid_data[x1, y1] = 1;
            } else { // Else count as a space
                grid_data[x1, y1] = 0;
            }
        } 
        else {
            grid_data[x1, y1] = 0;
        }
        x1 += 1;    
    }
    x1 = 0;
    y1 += 1;
}

all_filled_up = false;
flood_hit_boundary = false;

