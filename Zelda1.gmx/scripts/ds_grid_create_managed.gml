///ds_grid_create_managed(Width,Height,Description,Temp?)
//Creates a ds_list, stores it in a managed grid.
var _grid = ds_grid_create(argument[0],argument[1]);
var _row = ds_grid_add_row(DS_Grid_Managed);
ds_grid_set(DS_Grid_Managed,ds_managed_index,_row,_grid);
ds_grid_set(DS_Grid_Managed,ds_managed_desc,_row,argument[2]);
if(argument_count>3)
    ds_grid_set(DS_Grid_Managed,ds_managed_temp,_row,argument[3]);
else
    ds_grid_set(DS_Grid_Managed,ds_managed_temp,_row,false);
return(_grid);