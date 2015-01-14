///sector_is_saved(label)
//returns the sector's row if the sector is in the recent sector list, -1 if not.
with(obj_world_manager)
{  
    var _label = string(argument[0]);
    var _found = ds_grid_value_exists(recent_sector_grid,0,0,0,ds_grid_height(recent_sector_grid)-1,_label)
    //show_debug_message("Looking for "+_label+"  Exists? "+string(_found));
    if(_found)
    {
        var _row=ds_grid_value_y(recent_sector_grid,0,0,0,ds_grid_height(recent_sector_grid)-1,_label);
        //show_debug_message("Sector "+_label+" previously saved on row "+string(_row));
        return(_row);
    }
    else
    {
        //show_debug_message("Sector "+_label+" not previously saved.");
        return(-1);
        
        
    }
}