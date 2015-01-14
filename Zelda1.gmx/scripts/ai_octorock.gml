if(ai_state==ai_spawn)
{   //Snap to grid
    //show_debug_message("ai_octorock: Snapping to grid");
    
    actor_snap_to_grid(id);   
    var _dir=0;
    /*while(place_meeting(x,y,obj_wall))
    {   //Spawned in a wall, pick another place.
        x=x+lengthdir_x(tile_size,_dir) //round_n(x,tile_size)+grid_xoff;
        y=x+lengthdir_x(tile_size,_dir);
        _dir+=90;
    }*/
    
    //ai_pick_direction();
    ai_pick_destination();
    ai_state_next=ai_patrol;
}

if(ai_state==ai_patrol)
{   //Are we at our destination?
    //Snap to either axis if we are close
    //show_debug_message("Move speed:"+string(move_speed))
    if(abs(x-ai_destination_x)<=move_speed)
        x=ai_destination_x;
    if(abs(y-ai_destination_y)<=move_speed)
        y=ai_destination_y;
        
    var _continue=true;
    if(x == ai_destination_x && y == ai_destination_y)
    {   //Yup
        //show_debug_message("Arrived at point "+write_coordinates(ai_destination_x,ai_destination_y))
        var _choice = choose(ai_patrol, ai_patrol, ai_patrol, ai_patrol,ai_patrol,ai_attack);
        if(_choice == ai_patrol)
        {   //show_debug_message("Picking new destination");
            ai_pick_destination();
            _continue=true;
        }
        else
        {
            //show_debug_message("Should be attacking")
            ai_state_next=ai_attack;
            _continue=false;
        }
    }
    
    if(_continue)
    {   //Nope, keep walkin'
        //show_debug_message("X: "+write_coordinates(x,ai_destination_x)+"   Y: "+write_coordinates(y,ai_destination_y))
        if(x != ai_destination_x && abs(x-ai_destination_x)>abs(y-ai_destination_y))
        {   //We are closer to lining up with the X axis than the Y, but not yet lined up.
            //show_debug_message("tryin' to walk left or right");
            if(x-ai_destination_x<0)
                button_right=true;
            else
                button_left=true;
        }
        else
        {
            //show_debug_message("tryin' to walk up or down");
            if(y-ai_destination_y<0)
                button_down=true;
            else
                button_up=true;
        }
    }
}
else if(ai_state == ai_attack)
{   //Shoot
    if(ai_state_new)
    {
        
        ai_pick_destination();
        facing_direction=ai_decision;
        button_attack=true;
    }
    else
    {
        if(state != state_get_script("Attack"))
        {
            ai_pick_destination();
            if(choose(ai_attack,ai_patrol,ai_patrol,ai_patrol,ai_patrol,ai_patrol)==ai_patrol)
                ai_state_next=ai_patrol;
            else
            {
                facing_direction=ai_decision;
                button_attack=true;
                
            }    
        }
    }
}
else if (ai_state == ai_recover)
{   //Just got hit, figure out how to get back on track.
    //show_debug_message("Just knocked back, tryin' to recover.");
    ai_pick_destination();
    ai_state_next=ai_patrol;
}