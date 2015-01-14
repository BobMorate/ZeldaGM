///ai_get_sector_point_y(sector y)
//returns the Y coordinate in the room for the given sector, factoring in grid_toff;
if(instance_exists(obj_world_manager) && obj_world_manager.collision_grid != noone)
{
    var _y=obj_world_manager.bound_top+(tile_size*argument[0])+grid_yoff;
    return(_y);
}