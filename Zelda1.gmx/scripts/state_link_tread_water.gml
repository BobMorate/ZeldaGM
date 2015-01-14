///Link's standing state.
if(state_new)
{
    z=0;
    override_depth=false;
    image_speed=.1;
    shield_visible=false;
    shield_active=true;
    
    movement_code=swimming_movement_and_collision;
}
if(any_direction())
{
    state_switch("Swim");
}

if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);