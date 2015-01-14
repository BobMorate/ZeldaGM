///Goriya's standing state.
if(state_new)
{
    image_speed=0;
    shield_visible=false;
    shield_active=false;
}
if(any_direction())
{
    if(is_running)
        state_switch("Run");
    else
        state_switch("Walk");
}
if(button_attack)
    state_switch("Attack");