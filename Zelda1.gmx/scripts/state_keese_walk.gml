///Keese's walking state.
ignore_collision=true;
state_speed_override=true;
image_speed=move_speed*.75;
if(any_direction())
{
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
    
    if(state_new)
    {   //Silly people pressing two directions at once... 
        if(x_speed != 0 && y_speed>0)
        facing_direction=south;
        else if(x_speed != 0 && y_speed<0)
            facing_direction=north;
    }
}
else
{
    state_switch("Stand");
}