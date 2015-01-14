///camera_get_bounds(link's x, link's y);
var _x = cell_get_x(clamp(argument[0],0,room_width-1));
var _y = cell_get_y(clamp(argument[1],0,room_height-1));

//show_debug_message("Link is at: ("+string(_x)+","+string(_y)+") - Loading Bounds");

var _map = camera_grid[# _x,_y];

bound_left=ds_map_find_value(_map,"Bound Left");
bound_right=ds_map_find_value(_map,"Bound Right");
bound_top=ds_map_find_value(_map,"Bound Top");
bound_bot=ds_map_find_value(_map,"Bound Bot");
