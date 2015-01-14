///Link's standing state.
if(state_new)
{
    z=0;
    override_depth=false;
    image_speed=0;
    shield_visible=true;
    shield_yoff=0;
    shield_xoff=0;
    
    shield_direction=facing_direction;
    if(shield_direction=south)
        shield_visible=-1;
    else
        shield_visible=1;
    shield_active=true;
    grass_frame=0;
    movement_code=standard_movement_and_collision;
}
if(any_direction())
{
    if(is_running)
        state_switch("Run");
    else
        state_switch("Walk");
}
if(button_attack_pressed && save_data_get("Sword")>0)
    state_switch("Attack");
if(button_item_pressed)
    item_use();

if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);    

//Open Chests
if(button_context_pressed)
{

    if(facing_direction==north &&
       place_meeting(x,y-2,obj_chest_small))
    {
        var _chest=instance_place(x,y-2,obj_chest_small);
        _chest.active=true;
    }
    
    //Talk to NPCs
    else if(place_meeting(x+lengthdir_x(2,facing_direction),y+lengthdir_y(2,facing_direction),obj_npc_master))
    {
        var _npc = instance_place(x+lengthdir_x(2,facing_direction),y+lengthdir_y(2,facing_direction),obj_npc_master);
        _npc.active=true;
    }
    
    //Run
    else if(save_data_get("Boots")==1)
    {
        state_switch("Boots Windup");
    }

}