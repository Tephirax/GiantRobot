var x1, y1;

draw_set_color(c_white);

x1 = 0;
y1 = 0;

repeat (grid_h)
{
    repeat (grid_w)
    {
        draw_text(((x1 * 32) - 16),((y1 * 32) - 16), grid_data[x1, y1]);
        
        x1 += 1;
    }
    
    x1 = 0;
    y1 += 1;
}

