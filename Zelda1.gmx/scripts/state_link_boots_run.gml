if(state_new)
{
    z=0;
    image_speed=.3;
    shield_active=true;
    //Create Weapon
    my_weapon=instance_kill(my_weapon);
    my_weapon = instance_create(x,y,obj_weapon);
    my_weapon.owner=id;
    my_weapon.image_xscale=image_xscale;
    my_weapon.team=0;
    my_weapon.is_sticky=true;
    my_weapon.cuts_grass=true;
    switch(save_data_get("Sword"))
    {
        case 1: my_weapon.damage=.5;break;
        case 2: my_weapon.damage=1;break;
        case 3: my_weapon.damage=2;break;
    }
    //Set Sprite
    switch(facing_direction)
    {
        case north: my_weapon.sprite_index=spr_link_charge_north_collision;
                    break;
        case south: my_weapon.sprite_index=spr_link_charge_south_collision;
                    break;
        case east:
        case west:  my_weapon.sprite_index=spr_link_charge_east_collision;
                    break;
    }
}
//Splash sound
if(in_shallow_water && state_timer mod 10 == 0)
    sfx_play("Walk Splash");


//Bounce shield
if(facing_direction == east || facing_direction == west)
    shield_yoff = -floor(image_index) mod 2;
else
    shield_yoff = -(floor(image_index) mod 4) mod 3;

read_direction_controls();

if((x_speed != 0 || y_speed != 0) && point_direction(0,0,x_speed,y_speed) != facing_direction)
    state_switch("Walk");

x_speed=lengthdir_x(1,facing_direction);
y_speed=lengthdir_y(1,facing_direction);

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

if(against_wall > 0)
{
    var _wall=instance_place(x+lengthdir_x(3,facing_direction),y+lengthdir_y(3,facing_direction),obj_wall);
    if(_wall.object_index==obj_wall_jump && save_data_get("Feather")==true)
    {   //Wall Jump Stuff
        if(!place_meeting(x+lengthdir_x(32,facing_direction),y+lengthdir_y(32,facing_direction),obj_wall))
        {   //Jump
            state_switch("Boots Jump");
        }
        else
            state_switch("Boots Knockback");
    }
    else if(_wall.object_index==obj_wall_water_jump && save_data_get("Flippers")==true)
    {
        if(!place_meeting(x+lengthdir_x(32,facing_direction),y+lengthdir_y(32,facing_direction),obj_wall))
        {   //Jump
            state_switch("Boots Jump");
        }
        else
            state_switch("Boots Knockback");
    }
    else
        state_switch("Boots Knockback");
    my_weapon=instance_kill(my_weapon);
}