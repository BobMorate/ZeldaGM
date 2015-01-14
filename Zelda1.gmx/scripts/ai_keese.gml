if(ai_state==ai_spawn)
{   //Snap to grid
    ai_state_next=ai_wait;
    acceleration=.01;
    max_move_speed=1;
    wait_timer=random_range(0,1)*room_speed;
}
else if(ai_state==ai_patrol)
{   
    state_speed_override=true;
    if(ai_timer>total_travel_time)
    {
        ai_state_next=ai_wait;
        wait_timer=random_range(1,3)*room_speed;
        //show_debug_message("Keese: Going to Waiting state...")
    }
    else
    {   
        total_travel_timer++;
        //Alter Speed
        if(ai_timer>total_travel_time-(max_move_speed/acceleration))
        {   //Slowing down
            if(move_speed>0)
            {
                //show_debug_message("Keese: Deccelerating")
                move_speed-=acceleration;
            }
        }
        else
        {   //Speed up and travel
            if(move_speed < max_move_speed)
            {
                //show_debug_message("Keese: Accelerating: "+string(acceleration))
                move_speed+=acceleration;
                if(move_speed>max_move_speed)
                    move_speed=max_move_speed;
                    
                //show_debug_message("Keese: Accelerating: "+string(move_speed))
                
            }
        }
        //Stay inside Boundaries
        if( x<bound_left)
            x=bound_left;
        else if(x>bound_right)
            x=bound_right;
        if(y<bound_top)
            y=bound_top;
        else if(y>bound_bot)
            y=bound_bot;
        //Pick new direction
        if( x+lengthdir_x(max_move_speed,move_direction)<bound_left ||
            x+lengthdir_x(max_move_speed,move_direction)>bound_right||
            y+lengthdir_y(max_move_speed,move_direction)<bound_top ||
            y+lengthdir_y(max_move_speed,move_direction)>bound_bot)
        {   //Headin' out of screen.  Turn around.
            move_direction=angle_normalize(move_direction+choose(90,-90,135,-135,180));
            travel_time=random_range(.5,1)*room_speed;
            travel_timer=0;
        }
        if(travel_timer>travel_time)
        {
            move_direction=angle_normalize(move_direction+choose(0,45,-45,90,-90,180));
            travel_time=random_range(.5,1)*room_speed;
            travel_timer=0;
        }
        else
            travel_timer++;
        
        //Move in a direction
        switch(move_direction)
        {
            case east: button_right=true;break;
            case northeast:button_right=true;button_up=true;break;
            case north:button_up=true;break;
            case northwest:button_up=true;button_left=true;break;
            case west:button_left=true;break;
            case southwest:button_left=true;button_down=true;break;
            case south:button_down=true;break;
            case southeast:button_down=true;button_right=true;break;
            default: button_right=true;
        }
    }
}
else if(ai_wait)
{
    if(ai_timer>wait_timer)
    {
        //show_debug_message("Keese: Done Waiting");
        ai_state_next=ai_patrol;
        
        //Init travel properties
        travel_time=random_range(.5,1)*room_speed;
        travel_timer=0;
        total_travel_time=random_range(5,10)*room_speed;
        total_travel_timer=0;
        
        move_direction=irandom(8)*45;
    }
}