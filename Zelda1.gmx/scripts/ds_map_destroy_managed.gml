///ds_map_destroy_managed(map index)
//Destroys the given map and removes it from the appropriate manager grid.
var _map = argument[0];
if(ds_grid_value_exists(DS_Map_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_Map_Managed),_map) != -1)
{   //List found, remove it.
    var _row=ds_grid_value_y(DS_Map_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_Map_Managed),_map);
    DS_Map_Managed=ds_grid_delete_row(DS_Map_Managed,_row);
    ds_map_destroy(_map);
}
else
    show_message("Trying to delete a non-existent ds map");