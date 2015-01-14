///actor_zero_controls(id)
//zeros out the controls for the given actor.
with(argument[0])
{
    ///directional
    button_left=false;
    button_left_pressed=false;
    button_right=false;
    button_right_pressed=false;
    button_up=false;
    button_up_pressed=false;
    button_down=false;
    button_down_pressed=false;
    
    ///Face buttons
    button_attack=false;
    button_attack_pressed=false;
    button_item=false;
    button_item_pressed=false;
    button_context_pressed=false;
    button_context=false;
    
    //Triggers/Bumpers
    button_equip_next_pressed=false;
    button_equip_previous_pressed=false;
}