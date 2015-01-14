///state_add(State Name, State Script, State Move Speed, Sprite - Right, Sprite - Down, Sprite - Up,Sprite - Left);
//Creates a new state or changes an existing one.

var row=-1;
//See if a state with that name already exists
if(ds_grid_value_exists(state_grid,state_name,0,state_name,ds_grid_height(state_grid)-1,argument[0]))
{   //It Exists.  Modify it.
    row=ds_grid_value_y(state_grid,state_name,0,state_name,ds_grid_height(state_grid)-1,argument[0]);
}
else
{   //New State.  Create it.
    ds_grid_resize(state_grid,ds_grid_width(state_grid),ds_grid_height(state_grid)+1);
    row=ds_grid_height(state_grid)-1;
}

//Set up the values
ds_grid_set(state_grid,state_name,row,argument[0]);
ds_grid_set(state_grid,state_script,row,argument[1]);
ds_grid_set(state_grid,state_speed,row,argument[2]);

//Setup Sprites
if(argument_count>3)
{   
    ds_grid_set(state_grid,state_sprite_east,row,argument[3]);
    ds_grid_set(state_grid,state_sprite_west,row,argument[3]); ///Assume left is same as right for now.
    if(argument_count==4)
    {   //Just use all of the same sprites.
        
        ds_grid_set(state_grid,state_sprite_south,row,argument[3]);
        ds_grid_set(state_grid,state_sprite_north,row,argument[3]);
    }
    else if(argument_count<5 || argument_count<6)
    {
        //Why would there be a sprite for just 2 directions?
    }
    else if(argument_count<7)
    {   //There is a sprite for 3 directions (left is same as right).
        ds_grid_set(state_grid,state_sprite_south,row,argument[4]);
        ds_grid_set(state_grid,state_sprite_north,row,argument[5]);
    }
    else
    {   //There is a sprite for 4 directions!
        ds_grid_set(state_grid,state_sprite_south,row,argument[4]);
        ds_grid_set(state_grid,state_sprite_north,row,argument[5]);
        ds_grid_set(state_grid,state_sprite_west,row,argument[6]);
    }
}
else
{   //No Sprites indicated, fill with "noone"
    ds_grid_set(state_grid,state_sprite_east,row,noone);
    ds_grid_set(state_grid,state_sprite_south,row,noone);
    ds_grid_set(state_grid,state_sprite_north,row,noone);
}