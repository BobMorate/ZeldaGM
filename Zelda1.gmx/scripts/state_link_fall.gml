//Fall back into the game screen after being captured by wall master
if(state_new)
{
    is_frozen=false;
    is_invincible=true;
    shield_visible=false;
    shield_active=false;
    sfx_play("Fall",false)
    override_depth=true;
    depth=-20000;
}
override_depth=true;
depth=-20000;

var _fall_time=room_speed*1.5;
z=clamp(lerp(screen_width,0,state_timer/_fall_time),0,screen_width);

if(state_timer mod 4 == 0)
{   //Spin Link
    facing_direction-=90;
    facing_direction=angle_normalize(facing_direction);
}

if(z==0)
{
    facing_direction=north;
    state_switch("Stand");
}