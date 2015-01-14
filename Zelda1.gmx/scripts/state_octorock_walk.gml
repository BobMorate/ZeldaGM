///Octorock's walking state.
if(state_new)
{
    image_speed=.1;
    
}

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
    
    ///Tall Grass
    if(in_tall_grass)
    {
        grass_frame+=grass_speed;
    }
    else
        grass_frame=0;
        
    if(button_attack)
    {
        state_switch("Attack");
    }
}
else
{
    state_switch("Stand");
}