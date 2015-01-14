///ai_get_sector_point_x(sector x)
//returns the X coordinate in the room for the given sector, factoring in grid_xoff;
if(instance_exists(obj_world_manager) && obj_world_manager.collision_grid != noone)
{
    var _x=obj_world_manager.bound_left+(tile_size*argument[0])+grid_xoff;
    return(_x);
}