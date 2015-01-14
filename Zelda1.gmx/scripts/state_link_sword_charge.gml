///Link's sword charge state.
var _charge_length=room_speed*.75
if(state_new)
{
    image_speed=0;
    
    shield_active=true;
    //Create Weapon
    my_weapon=instance_kill(my_weapon);
    my_weapon = instance_create(x,y,obj_weapon);
    my_weapon.owner=id;
    my_weapon.image_xscale=image_xscale;
    my_weapon.team=0;
    my_weapon.is_sticky=true;
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

if(!button_attack)
{
    if(state_timer>=_charge_length)
        state_switch("Charge Attack");
    else
        state_switch("Stand");
}

if(state_timer==_charge_length)
    sfx_play("Sword Charge");
    
if(any_direction())
{
    ///Splash Sound
    if(in_shallow_water && state_timer mod 15 == 0)
        sfx_play("Walk Splash");
        
    image_index+=.3;
    //Bounce shield
    switch(facing_direction)
    {
        case north:shield_yoff = 2 +floor(image_index) mod 3; break;
        case south:shield_yoff = 3 +floor(image_index) mod 3; break;
    }
    read_direction_controls();
}
else
{
    x_speed=0;
    y_speed=0;
    switch(facing_direction)
    {
        case north: shield_direction=east;
                    shield_xoff=1;
                    shield_yoff=2;
                    part_type_direction(part_sword_charge,80,80,0,0);
                    charge_part_x=-5;
                    charge_part_y=-10;
                    break;
        case south: shield_direction=west; 
                    shield_xoff=0;
                    shield_yoff=3;
                    charge_part_x=6;
                    charge_part_y=1;
                    part_type_direction(part_sword_charge,250,250,0,0);
                    break;
        case east:  shield_direction=north;
                    shield_visible=false;
                    charge_part_x=6;
                    charge_part_y=-5;
                    part_type_direction(part_sword_charge,0,0,0,0);
                    break;
        case west:  shield_direction=north;
                    shield_visible=false;
                    charge_part_x=-6;
                    charge_part_y=-5;
                    part_type_direction(part_sword_charge,180,180,0,0);
                    break;
    }
    image_index=0;
}

//Flash Palette Do particles
if(state_timer > _charge_length)
{
    if(state_timer mod 5 == 0)
        pal_swap_override_color(17,$00d0ff);
    if(state_timer mod 4 == 0)
        pal_swap_override_color(17,$282828);
    if(state_timer mod 10 == 0)
        part_particles_create(FX_System,x+charge_part_x,y+charge_part_y,part_sword_charge,1);
    
}
//Stab
if(my_weapon != noone && ds_list_size(my_weapon.hit_list)>0)
{   //We hit someone, go back to stand for now.
    state_switch("Stand");
}

//Listen to controls.
if(button_item_pressed)
    item_use();

if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);  

//Sword magnet
if(save_data_get("Magnet") && state_timer>_charge_length)
{
    var _max_dist=screen_width;
    var _min_dist=22;
    var _max_speed=clamp(lerp(0,3,(state_timer-_charge_length)/(room_speed*5)),0,3);
    with(obj_rupee_1)
    {
        var _dist=point_distance(x,y,other.x,other.y);
        if(weapon_grab && _dist<_max_dist && _dist>_min_dist && !picked_up && is_in_sector(x,y))
        {   //Move towards link.
            var _dir=point_direction(x,y,other.x,other.y);
            var _spd=lerp(_max_speed,0,_dist/_max_dist);
            x=x+lengthdir_x(_spd,_dir);
            y=y+lengthdir_y(_spd,_dir);
            depth=-y;
        }
    }
    
}