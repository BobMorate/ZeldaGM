//Octorock gets knocked back.
if(state_new)
{
    image_index=1;
    state_limit=40;
    temp_invincibility_timer=30;
    state_interruptable=false;
    active=false;
    if(instance_exists(attacker))
    {
        state_direction=round_n(point_direction(attacker.x,attacker.y,x,y),90);
    }
}
if(state_timer>= state_limit)
{
    {
        state_switch("Retreat");
        ai_state=ai_recover;
        z=0;
    }
}
else
{   //Knockback
    if(state_direction!=-1 && state_timer<10)
    {
        //show_debug_message("Temp Invincibility Timer: "+string(temp_invincibility_timer));
        x_speed=lengthdir_x(1,state_direction);
        y_speed=lengthdir_y(1,state_direction);
    }
    else if(state_timer>=10)
    {
        if(hit_points<=0)
        {
            with(instance_create(x,y,obj_fx_small_explosion))
                depth=other.depth;
            sfx_play("Enemy Kill");
            is_visible=false;
            just_died=true;
            state_switch("Stand");
        }
        x_speed=0;
        y_speed=0;
    }
}

//show_debug_message("State Not Interruptable!"+string(state_interruptable));