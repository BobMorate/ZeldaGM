///ds_grid_destroy_managed(grid index)
//Destroys the given grid and removes it from the appropriate manager grid.
var _grid = argument[0];
if(ds_grid_value_exists(DS_Grid_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_Grid_Managed),_grid) != -1)
{   //List found, remove it.
    var _row=ds_grid_value_y(DS_Grid_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_Grid_Managed),_grid);
    DS_Grid_Managed=ds_grid_delete_row(DS_Grid_Managed,_row);
    ds_grid_destroy(_grid);
}
else
    show_message("Trying to delete a non-existent ds grid");