///ds_list_destroy_managed(list index)
//Destroys the given list and removes it from the appropriate manager grid.
var _list = argument[0];
if(ds_grid_value_exists(DS_List_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_List_Managed),_list) != -1)
{   //List found, remove it.
    var _row=ds_grid_value_y(DS_List_Managed,ds_managed_index,0,ds_managed_index,ds_grid_height(DS_List_Managed),_list);
    DS_List_Managed=ds_grid_delete_row(DS_List_Managed,_row);
    ds_list_destroy(_list);
}
else
    show_message("Trying to delete a non-existent ds list");