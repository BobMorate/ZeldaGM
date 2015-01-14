if(state_new)
{
    is_invincible=true;
    active=false;
    visible=false;
    if(!just_died)
        wait_timer=random_range(2,4)*room_speed;
    else
    {
        wait_timer=random_range(4,7)*room_speed;
        hit_points=2;
    }
    just_died=false;
    
}

if(state_timer>wait_timer)
{
    state_switch("Attack");
}