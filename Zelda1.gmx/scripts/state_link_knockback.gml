//Link gets knocked back.
if(state_new)
{
    temp_x=x-view_xview;
    temp_y=y-view_yview;
    state_interruptable=false;
    state_limit=10;
    temp_invincibility_timer=45;
    sfx_play("Link Hurt");
    if(facing_direction == east || facing_direction == west)
        shield_visible=false;
}

if(state_timer>= state_limit && hit_points>0)
{
    state_switch("Stand");
    z=0;
}
else if(hit_points>0)
{   //Knockback       
    x_speed=lengthdir_x(1,state_direction);
    y_speed=lengthdir_y(1,state_direction);
    z=arc(0,8,0,state_timer/state_limit,.7);
}
else
{   //Death
    with(obj_actor_master)
        is_frozen=true;
    obj_link.is_frozen=false;
    instance_kill(obj_projectile);
    state_interruptable=false;
    temp_invincibility_timer=0;
    is_invincible=true;
    override_depth=true;
    depth=-50001;
    previous_room=room;
    if(!instance_exists(obj_transfx_spotlight_out))
    {
        var _fx=instance_create(x,y,obj_transfx_spotlight_out);
        _fx.target=id;
        _fx.length=1.5*room_speed;
        FMODInstanceFadeVolume(BGM,BGM_Volume,0,1.5*room_speed);
        
    }
    if(state_timer>room_speed*1.5)
    {
        room_goto(rm_game_over);
        view_xview=0;
        view_yview=0;
        x=temp_x;
        y=temp_y;
        state_switch("Death");
        instance_kill(obj_transfx_spotlight_out);
        ignore_room_boundries=true;
        ignore_view_transitions=true;
        ignore_collision=true;
    }
    
    
}