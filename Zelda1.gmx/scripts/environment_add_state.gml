///environment_add_state(Enum value, Color, Length <frames>, Next State, Lights?, Rain Color, Clouds?, Fog?);
var _row=ds_grid_add_row(state_stuff);
ds_grid_set(state_stuff,0,_row,argument[0]); //State Enum Value
ds_grid_set(state_stuff,1,_row,argument[1]); //State Color
ds_grid_set(state_stuff,2,_row,argument[2]); //Length
ds_grid_set(state_stuff,3,_row,argument[3]); //Next State?
ds_grid_set(state_stuff,4,_row,argument[4]); //State Lights Enabled?
ds_grid_set(state_stuff,5,_row,argument[5]); //Rain Allowed;
ds_grid_set(state_stuff,6,_row,argument[6]); //Clouds Allowed;
ds_grid_set(state_stuff,7,_row,argument[7]); //Fog Allowed;