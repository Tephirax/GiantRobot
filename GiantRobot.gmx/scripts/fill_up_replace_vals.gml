// fill_up_replace_vals(fill_value) = num_cells_changed;

var fill_val;
var cells_changed;
var x1, y1;

fill_val = argument[0];

x1 = 0;
y1 = 0;

cells_changed = 0;

repeat (grid_h)
{
    repeat (grid_w)
    {
        if (test_grid[x1, y1] = -1)
        {
            test_grid[x1, y1] = fill_val;
            cells_changed += 1;
        }
        
        x1 += 1;
    }
    
    x1 = 0;
    y1 += 1;
}

return cells_changed;

