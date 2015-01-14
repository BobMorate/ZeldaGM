//state_get(State Key <string>)
if(ds_grid_value_exists(state_grid,state_name,0,state_name,ds_grid_height(state_grid)-1,argument[0]))
{
    var row = ds_grid_value_y(state_grid,state_name,0,state_name,ds_grid_height(state_grid)-1,argument[0])
    return(ds_grid_get(state_grid,state_script,row));
}
else
{
    show_debug_message("State "+script_get_name(argument[0])+" not found.");
    return(-1);
}

//return(ds_map_find_value(state_map,argument[0]));