///item_grid_add(key,cooldown,sprite,subimage,min value,use state);
var _row=ds_grid_add_row(item_grid);
ds_grid_set(item_grid,item_key,_row,argument[0]);
ds_grid_set(item_grid,item_cooldown,_row,argument[1]);
ds_grid_set(item_grid,item_current_cooldown,_row,0);
ds_grid_set(item_grid,item_sprite,_row,argument[2]);
ds_grid_set(item_grid,item_subimage,_row,argument[3]);
//Can equip, but can't "use" until at least this value.
//Will be passed over when using "quick" equip
ds_grid_set(item_grid,item_min_value,_row,argument[4]); 
ds_grid_set(item_grid,item_state,_row,argument[5]);