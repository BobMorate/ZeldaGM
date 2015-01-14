if(state_new)
{
    z=0;
    image_speed=.5;
    shield_active=true;
}

//Bounce shield
if(facing_direction == east || facing_direction == west)
    shield_yoff = -floor(image_index) mod 2;
else
    shield_yoff = -(floor(image_index) mod 4) mod 3;

//Splash sound
if(in_shallow_water && state_timer mod 10 == 0)
    sfx_play("Walk Splash");
    
read_direction_controls();
//Set facing_direction
if(x_speed>0 && y_speed==0)
    facing_direction=east;
else if(x_speed<0 && y_speed==0)
    facing_direction=west;
else if(x_speed==0 && y_speed<0)
    facing_direction=north;
else if(x_speed==0 && y_speed>0)
    facing_direction=south;
else if(x_speed<0)
    facing_direction=west;
else if(x_speed>0)
    facing_direction=east
else if(y_speed>0)
    facing_direction=south;
else if(y_speed<0)
    facing_direction=north;

shield_direction=facing_direction;
if(shield_direction=south)
    shield_visible=-1;
else
    shield_visible=1;

if(state_timer mod 7 == 0)
{
    sfx_play("Dash",false);
}
if(state_timer mod 13 == 0)
{
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

if(state_timer > room_speed*.5)
{
    state_switch("Boots Run");
}

if(!button_context)
{
    state_switch("Stand");
}