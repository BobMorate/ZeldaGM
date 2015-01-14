///Keese's standing state.
if(state_new)
{
    image_speed=0;
    image_index=0;
    shield_visible=false;
    shield_active=false;
    ignore_collision=true;
}

if(any_direction())
        state_switch("Walk");