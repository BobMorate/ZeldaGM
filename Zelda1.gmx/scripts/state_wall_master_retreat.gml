if(state_new)
{
    image_index=1;
    visible=true;
    z=0;
    is_invincible=true;
    override_depth=true;
    depth=-20000; 
}
var _retreat_time=room_speed*1;
z=clamp(interpolate(0,screen_width,state_timer/_retreat_time,.3),0,screen_width);

if(state_timer>_retreat_time)
{
    if(obj_link.z==z)
    {   //Link was captured
        var _trans=transition_create(.5*room_speed,1*room_speed,.5*room_speed);
        transition_add_fade_out(_trans);
        transition_add_fade_in(_trans);
        transition_move_link(_trans,"Stand",-1,"Game Start","Fall",-1,false);
    }
    
    state_switch("Stand");
}