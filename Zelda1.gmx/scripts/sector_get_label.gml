///sector_get_label(link x, link y)
var _x = cell_get_x(clamp(argument[0],0,room_width-1));
var _y = cell_get_y(clamp(argument[1],0,room_height-1));
    
var _map = camera_grid[# _x,_y];
var _label=ds_map_find_value(_map,"Label");
//show_debug_message("Current Sector: "+_label);
return(_label);