///camera_get_collision(link's x, link's y);
var _x = cell_get_x(clamp(argument[0],0,room_width-1));
var _y = cell_get_y(clamp(argument[1],0,room_height-1));

//show_debug_message("Link is at: ("+string(_x)+","+string(_y)+")");

var _map = camera_grid[# _x,_y];

collision_grid=ds_map_find_value(_map,"Collision Grid");

if(ds_grid_width(collision_grid)==0)
{
    show_debug_message("Building Collision Grid for "+write_coordinates(_x,_y));
    //show_debug_message("Bounds: X: "+write_coordinates(bound_left,bound_right+screen_width)+"  Y: "+write_coordinates(bound_top,bound_bot+screen_height));
    var _tilesize=tile_size;
    var _s_width = bound_right-bound_left+screen_width;
    var _s_height = bound_bot-bound_top+screen_height;
    ds_grid_resize(collision_grid,_s_width/_tilesize,_s_height/_tilesize)
    ds_grid_clear(collision_grid,0);
    
    for(var _x=0;_x<ds_grid_width(collision_grid);_x++)
    {
        for(var _y=0;_y<ds_grid_height(collision_grid);_y++)
        {
            if(tile_layer_find(safe_path_layer,bound_left+(_x*_tilesize),bound_top+(_y*_tilesize)) != -1)
                collision_grid[# _x,_y]=true;
        }
    }
}
else
    show_debug_message("Collision Grid Already Exists");