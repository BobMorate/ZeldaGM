///swimming_movement_and_collision()
if(!is_frozen && !is_destroyed)
{
    //Check for Walls
    var _against_wall=false;
    if(place_meeting(x+x_speed,y,obj_wall))
    {
        _against_wall=true;
        x_speed=0;
        against_wall++;
    }
    if(place_meeting(x,y+y_speed,obj_wall))
    {
        _against_wall=true;
        y_speed=0;
        against_wall++;
    }
    if(!_against_wall)
        against_wall=0;
        
    actor_escape_wall();
    x+=x_speed;
    y+=y_speed;
    
    //Apply friction
    if(x_speed>0)
        x_speed=clamp(x_speed-swim_friction,0,swim_max);
    else if(x_speed<0)
        x_speed=clamp(x_speed+swim_friction,-swim_max,0);
    if(y_speed>0)
        y_speed=clamp(y_speed-swim_friction,0,swim_max);
    else if(y_speed<0)
        y_speed=clamp(y_speed+swim_friction,-swim_max,0);

            

    //Stay in room.
    if(!ignore_room_boundries)
    {
        x=clamp(x,0,room_width-1);
        y=clamp(y,0,room_height-1);
    }
    
    //Stay in sector
    if(instance_exists(obj_world_manager) && keep_in_sector)
    {   
        var _buffer=tile_size*.5;
        x=clamp(x,obj_world_manager.bound_left+_buffer,obj_world_manager.bound_right+screen_width-_buffer);
        y=clamp(y,obj_world_manager.bound_top+_buffer,obj_world_manager.bound_bot+screen_height-_buffer);
    }
    
    //Depth
    if(!override_depth)
        depth=-y;
}