///sector_disable_enemies(sector label)
//disables all enemies in the given sector
var _row = sector_is_saved(argument[0])
if(_row > -1)
{
    var _list = ds_grid_get(recent_sector_grid,1,_row);
    for(var i=0; i<ds_list_size(_list);i++)
        instance_deactivate_object(ds_list_find_value(_list,i)); //Deactivate all instances in list.
}
else
    show_debug_message("Trying to disable enemies in a sector that is not saved...");