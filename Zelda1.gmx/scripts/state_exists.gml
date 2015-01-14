//state_exists(State Key <string>)
if(ds_grid_value_exists(state_grid,state_name,0,state_name,ds_grid_height(state_grid)-1,argument[0]))
    return(true);
else
    return(false);