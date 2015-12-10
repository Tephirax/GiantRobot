// fill_up_flood(x1, y1);

var x1, y1;

x1 = argument[0];
y1 = argument[1];

test_grid[x1, y1] = -1;

// Check Right
if (x1 + 1 > grid_w - 1)
{
    // Hit boundary
    flood_hit_boundary = true;
}
else
{
    if (test_grid[x1 + 1, y1] = 0)
    {
        // Flood to Right Cell
        fill_up_flood(x1 + 1, y1);
    }
}

// Check Up
if (y1 - 1 < 0)
{
    // Hit boundary
    flood_hit_boundary = true;
}
else
{
    if (test_grid[x1, y1 - 1] = 0)
    {
        // Flood to Up Cell
        fill_up_flood(x1, y1 - 1);
    }
}

// Check Left
if (x1 - 1 < 0)
{
    // Hit boundary
    flood_hit_boundary = true;
}
else
{
    if (test_grid[x1 - 1, y1] = 0)
    {
        // Flood to Left Cell
        fill_up_flood(x1 - 1, y1);
    }
}

// Check Down
// Check Up
if (y1 + 1 > grid_h - 1)
{
    // Hit boundary
    flood_hit_boundary = true;
}
else
{
    if (test_grid[x1, y1 + 1] = 0)
    {
        // Flood to Down Cell
        fill_up_flood(x1, y1 + 1);
    }
}

