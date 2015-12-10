if (!all_filled_up)
{
    var x1, y1;
    
    fill_up_execute();
    
    x1 = 0;
    y1 = 0;
    
    repeat (grid_h)
    {
        repeat (grid_w)
        {
            if (test_grid[x1, y1] = 2)
            {
                grid_data[x1, y1] = 2;
            }
            
            x1 += 1;
        }
        
        x1 = 0;
        y1 += 1;
    }
    
    all_filled_up = true;
}

