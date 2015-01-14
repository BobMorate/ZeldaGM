///standard_movement_and_collision()
if(!is_frozen && !is_destroyed)
{
    movement_direction = point_direction(0,0,x_speed,y_speed);
    if(!state_speed_override)
    {
        move_speed=state_get_speed(state);
        //Would love to make this actually work the way I want it to work...
        if(position_meeting(x,y,obj_slow_up_down))
            move_speed*=.35;
        else if(position_meeting(x,y,obj_slow_left_right))
            move_speed*=.35;
        else if(position_meeting(x,y,obj_speed_doubler))
            move_speed*=2;
    }
    //else
    //    show_debug_message('Ignoring state speed. Speed='+write_coordinates(x_speed,y_speed))
    
        
    if(x_speed != 0 || y_speed != 0)
    {   //We are movin'
        
        var _this_wall=instance_place(x+lengthdir_x(move_speed,movement_direction),y+lengthdir_y(move_speed,movement_direction),obj_wall);
        var _solid=false;
        if(_this_wall != noone && _this_wall.enabled)
            _solid=true;
        if(!_solid || ignore_collision) //!place_meeting(x+lengthdir_x(move_speed,movement_direction),y+lengthdir_y(move_speed,movement_direction),obj_wall) || ignore_collision
        {   //No walls.  Free to move.
            x+=lengthdir_x(move_speed,movement_direction);
            y+=lengthdir_y(move_speed,movement_direction);
            against_wall=0;
        }
        else
        {
            x=round(x);
            y=round(y);
            //Snap to wall
            while(!place_meeting(x,y,obj_wall))
            {
                x+=1*sign(x_speed);
                y+=1*sign(y_speed);
            }
            x-=1*sign(x_speed);
            y-=1*sign(y_speed);
            
            var _check_angle=45;
            var _check_dist=1;
            var _corner_check=6;
            if(state != state_get_script("Knock Back"))
            {
                if(!place_meeting(x+lengthdir_x(move_speed*_check_dist,movement_direction+_check_angle),y+lengthdir_y(move_speed*_check_dist,movement_direction+_check_angle),obj_wall))
                {   //Ramps Left
                    x+=round(lengthdir_x(move_speed,movement_direction+_check_angle));
                    y+=round(lengthdir_y(move_speed,movement_direction+_check_angle));
                    against_wall=0;
                }
                else if(!place_meeting(x+lengthdir_x(move_speed*_check_dist,movement_direction-_check_angle),y+lengthdir_y(move_speed*_check_dist,movement_direction-_check_angle),obj_wall))
                {   //Ramps Right
                    if(movement_direction=north) //WHY???!?!?!
                        x++;
                    //show_debug_message("Ramping Right");
                    x+=round(lengthdir_x(move_speed,movement_direction-_check_angle));
                    y+=round(lengthdir_y(move_speed,movement_direction-_check_angle));
                    against_wall=0;
                }
                else
                {   //You're stuck.
                    against_wall++;
                }
            }
        }
    }
    else
    {
        movement_direction=noone;
        against_wall=0;
        x=round(x);
        y=round(y);
    }

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