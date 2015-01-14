//Keese gets knocked back.
if(state_new)
{
    ignore_collision=true;
    is_dangerous=false;
    image_speed=0;
    state_limit=10;
    temp_invincibility_timer=30;
    state_interruptable=false;
    state_speed_override=false;
    if(instance_exists(attacker))
    {
        var _dif=abs(angle_difference(facing_direction,point_direction(x,y,attacker.x,attacker.y)));
        state_direction=point_direction(x,y,attacker.x,attacker.y)-180;
    }
}


if(state_timer>= state_limit)
{
    if(hit_points<=0)
        instance_destroy();
    else
    {
        state_switch("Stand");
        is_dangerous=true;
        ai_state=ai_recover;
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
}