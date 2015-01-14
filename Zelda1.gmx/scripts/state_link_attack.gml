///Link's attack state.
if(state_new)
{
    shield_active=false;
    
    image_speed=0;
    //image_index=0;
    x=round(x);
    y=round(y);
    
    //Create Weapon
    my_weapon = instance_create(x,y,obj_weapon);
    my_weapon.owner=id;
    my_weapon.image_xscale=image_xscale;
    my_weapon.team=0;
    my_weapon.cuts_grass=true;
    var _sound="";
    switch(save_data_get("Sword"))
    {
        case 1: my_weapon.damage=1;_sound=choose("Sword Swing 1","Sword Swing 2"); break;
        case 2: my_weapon.damage=2;_sound=choose("Sword Swing 1","Sword Swing 2"); break;
        case 3: my_weapon.damage=4;_sound=choose("Sword Swing 3","Sword Swing 4"); break;
    }
    
    sfx_play(_sound);
    switch(facing_direction)
    {
        case north: shield_direction=east; 
                    my_weapon.sprite_index=spr_link_attack_north_collision;
                    
                    shield_xoff=2;
                    shield_yoff=-3;break;//-2 probably
        case south: shield_direction=west; 
                    my_weapon.sprite_index=spr_link_attack_south_collision;
                    shield_xoff=1;
                    shield_yoff=-2;
                    break;
        case east:
        case west:  shield_visible=false;
                    my_weapon.sprite_index=spr_link_attack_east_collision;
                    break;
    }

    timeline_index=tml_link_attack;
    timeline_position=0;
    timeline_running=true;
    timeline_speed=.75;
}
else if(button_attack_pressed)
{
    state_switch("Attack");
}
