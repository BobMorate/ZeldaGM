///sound_add(Key,Path)
var _row=ds_grid_add_row(Sound_Grid);
ds_grid_set(Sound_Grid,sound_key,_row,argument[0]);
ds_grid_set(Sound_Grid,sound_resource,_row,FMODSoundAdd(argument[1],false,true));