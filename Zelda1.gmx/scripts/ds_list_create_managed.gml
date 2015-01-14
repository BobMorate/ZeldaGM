///ds_list_create_managed(Description,Temp?)
//Creates a ds_list, stores it in a managed grid.
var _list = ds_list_create();
var _row = ds_grid_add_row(DS_List_Managed);
ds_grid_set(DS_List_Managed,ds_managed_index,_row,_list);
ds_grid_set(DS_List_Managed,ds_managed_desc,_row,argument[0]);
ds_grid_set(DS_List_Managed,ds_managed_temp,_row,argument[1]);
return(_list);