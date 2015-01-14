//ai_get_sector_y()
//returns the grid y value for the nearest grid point.
if(instance_exists(obj_world_manager) && obj_world_manager.collision_grid != noone)
{
    var _y=floor(y)-obj_world_manager.bound_top;
    _y/=tile_size;
    _y=clamp(_y,0,ds_grid_height(obj_world_manager.collision_grid));
    return(floor(_y));
}