var x1, y1, num_cells, curr_cells;
var cell_x, cell_y;

/* Test grid key
-1 = flood_fill temporary value
0 = Unchecked
1 = Checked/Unenclosed
2 = Enclosed
*/

test_grid[0, 0] = 0;

num_cells = grid_w * grid_h;

curr_cells = 0;

x1 = 0;
y1 = 0;

// Create test_grid and count number of "walls"
repeat (grid_h)
{
    repeat (grid_w)
    {
        test_grid[x1, y1] = grid_data[x1, y1];
        if (test_grid[x1, y1] = 1)
        {
            curr_cells += 1;
        }
        
        x1 += 1;
    }
    
    x1 = 0;
    y1 += 1;
}

cell_x = compartment_cell_x;
cell_y = compartment_cell_y;

// Check valid starting cell
var valid_cell, flood_val;
valid_cell = false;
    
do {
    if (test_grid[cell_x, cell_y] = 0) {
        valid_cell = true;
    } else {
        cell_x += 1;
            
        if (cell_x > grid_w - 1) {
            cell_x = 0;
            cell_y += 1;
        }
    }
} until (valid_cell);
        
flood_hit_boundary = false;
    
fill_up_flood(cell_x, cell_y);

if (flood_hit_boundary)
    {
        curr_cells += fill_up_replace_vals(1);
    }
    else
    {
        curr_cells += fill_up_replace_vals(2);
    }
