//ai_get_sector_x()
//returns the grid x value for the nearest grid point.
if(instance_exists(obj_world_manager) && obj_world_manager.collision_grid != noone)
{
    var _x=round(x)-obj_world_manager.bound_left;
    _x/=tile_size;
    _x=clamp(_x,0,ds_grid_width(obj_world_manager.collision_grid));
    
    return(floor(_x));
}