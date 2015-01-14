///Link's jumping state
if(state_new)
{
    if(is_swimming)
    {
        sfx_play("Splash",false);
        instance_create(x,y,obj_fx_splash);
    }
    else
    {
        sfx_play("Jump",false);
        var _inst=instance_create(x,y,obj_fx_dust);
        _inst.image_speed=.2;
        switch(facing_direction)
        {
            case north:
            case south:_inst.y+=8;break;
            case west: _inst.image_xscale=-1; _inst.x+=8; break;
            case east: _inst.x-=8;break;
        }
    }
    
    state_interruptable=false;
    is_invincible=true;
    
    z=0;
    image_speed=0;
    image_index=1;
    shield_active=true;
    //Position shield
    if(facing_direction == east || facing_direction == west)
        shield_yoff = -floor(image_index) mod 2;
    else
        shield_yoff = -(floor(image_index) mod 4) mod 3;
    shield_direction=facing_direction;
    if(shield_direction=south)
        shield_visible=-1;
    else
        shield_visible=1;
        
    start_x=x;
    start_y=y;
    destination_x=x+lengthdir_x(32,facing_direction);
    destination_y=y+lengthdir_y(32,facing_direction);
    ignore_collision=true;
}

var _length=.5*room_speed;

x=lerp(start_x,destination_x,state_timer/_length);
y=lerp(start_y,destination_y,state_timer/_length);    
z=arc(0,10,0,state_timer/_length,.8);
if(state_timer>_length)
{
    x=destination_x;
    y=destination_y;
    z=0;
    ignore_collision=false;
    if(tile_layer_find(water_layer,x,y) != -1)
    {
        ///Can't swim yet.
        instance_create(x,y,obj_fx_splash);
        sfx_play("Splash",false);
        if(save_data_get("Flippers"))
        {
            state_switch("Tread Water");
            is_swimming=true;
        }
        else
        {
            hit_points=clamp(hit_points-.5,.5,100);
            sfx_play("Link Hurt");
            x=link_safe_x;
            y=link_safe_y;
            temp_invincibility_timer=30;
            state_switch("Stand");
        }
    }
    else
    {
        state_switch("Stand");
        is_swimming=false;
    }
    is_invincible=false;
}