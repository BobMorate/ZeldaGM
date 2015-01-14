///environment_state_get_row(State Enum Value)
if(ds_grid_value_exists(state_stuff,0,0,0,ds_grid_height(state_stuff)-1,argument[0]))
{
    return(ds_grid_value_y(state_stuff,0,0,0,ds_grid_height(state_stuff)-1,argument[0]));
}
else
    show_message("Idiot.  That state doesn't exist");