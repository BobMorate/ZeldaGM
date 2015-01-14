//Gel gets knocked back.
if(state_new)
{
    timeline_index=noone;
    timeline_position=0;
    timeline_running=false;
    
    state_limit=10;
    temp_invincibility_timer=30;
    state_interruptable=false;
    is_dangerous=false;
    if(instance_exists(attacker))
    {
        state_direction=round_n(point_direction(attacker.x,attacker.y,x,y),90);
    }
}
//show_debug_message("State Timer: "+string(state_timer));
if(state_timer>= state_limit)
    instance_destroy();
else
{   //Knockback
    if(state_direction!=-1)
    {
        x_speed=lengthdir_x(1,state_direction);
        y_speed=lengthdir_y(1,state_direction);
    }
}

//show_debug_message("State Not Interruptable!"+string(state_interruptable));