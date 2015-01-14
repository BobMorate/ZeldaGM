///sector_save_enemies(sector label)
//Saves the current enemy list, destroys old list if it still exists.
var _row=sector_is_saved(argument[0]);
//show_debug_message("Saving current sector enemies to row "+string(_row));
if(_row>-1)
{
    var _list = ds_grid_get(recent_sector_grid,1,_row);
    //show_debug_message("Loading Enemy List, Index: "+string(_list));
    ds_list_clear(_list); //Clear out any old enemies.
    with(obj_enemy_master)
    {
        ds_list_add(_list,id);
    }
}
else
    show_debug_message("Oh shit! Trying to save an enemy list for a sector that hasn't been saved...");