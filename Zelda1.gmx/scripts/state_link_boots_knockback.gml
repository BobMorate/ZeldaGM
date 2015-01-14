//Link gets knocked back from running.
if(state_new)
{
    state_interruptable=false;
    is_invincible=true;
    
    state_limit=30;
    state_direction=facing_direction-180;
    sfx_play("Bomb Blow");
    if(facing_direction == east || facing_direction == west)
        shield_visible=false;
    var _shake=instance_create(0,0,obj_fx_screenshake);
    _shake.direction=facing_direction;
    _shake.amp=10;
}

if(state_timer>= state_limit && hit_points>0)
{
    state_switch("Stand");
    is_invincible=false;
    z=0;
}
else if(hit_points>0)
{   //Knockback       
    x_speed=lengthdir_x(1,state_direction);
    y_speed=lengthdir_y(1,state_direction);
    z=arc(0,12,0,state_timer/state_limit,.7);
}