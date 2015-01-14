//Goriya gets knocked back.
if(state_new)
{
    
    state_limit=10;
    temp_invincibility_timer=30;
    state_interruptable=false;
    is_dangerous=false;
    if(instance_exists(attacker))
    {
        var _dif=abs(angle_difference(facing_direction,point_direction(x,y,attacker.x,attacker.y)));
        //show_debug_message("Angle Dif: "+string(_dif)+" My Angle: "+string(facing_direction)+"  Attacker direction: "+string(point_direction(x,y,attacker.x,attacker.y)));
        if(_dif<=45)
        {   //Launch backwards
            state_direction=facing_direction+180;
        }
        else if(_dif>=135)
        {   //Launch Forwards
            state_direction=facing_direction;
        }
        else
            state_direction=-1;
    }
}

if(state_timer>= state_limit)
{
    if(hit_points<=0)
        instance_destroy();
    else
    {
        state_switch("Stand");
        ai_state=ai_recover;
        is_dangerous=true;
        z=0;
    }
}
else
{   //Knockback
    if(state_direction!=-1)
    {
        x_speed=lengthdir_x(1,state_direction);
        y_speed=lengthdir_y(1,state_direction);
    }
    //z=arc(0,8,0,state_timer/state_limit,.7);
}

//show_debug_message("State Not Interruptable!"+string(state_interruptable));