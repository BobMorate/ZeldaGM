///ai_can_move(x,y)
//returns true if the given collision grid cell is available, false otherwise.
if(instance_exists(obj_world_manager) && obj_world_manager.collision_grid != noone)
{
    var _is_safe;
    with(obj_world_manager)
    {
        _is_safe=collision_grid[# argument[0],argument[1]];
        if(position_meeting(bound_left+argument[0]*tile_size+tile_size/2,
                            bound_top+argument[1]*tile_size+tile_size/2,obj_wall))
            _is_safe=false;
    
    }
    return(_is_safe);
    
}