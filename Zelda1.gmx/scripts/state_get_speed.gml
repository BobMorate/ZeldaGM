///state_get_speed(State Script Index)
if(ds_grid_value_exists(state_grid,state_script,0,state_script,ds_grid_height(state_grid)-1,argument[0]))
{
    var row = ds_grid_value_y(state_grid,state_script,0,state_script,ds_grid_height(state_grid)-1,argument[0])
    return(ds_grid_get(state_grid,state_speed,row));
}
else
{
    show_debug_message("State "+script_get_name(argument[0])+" not found.");
    return(0);
}