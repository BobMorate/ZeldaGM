///sector_save(sector_label)
//Adds the sector given the label to the recent sector grid.
with(obj_world_manager)
{
    var _label = argument[0];
    
    if(sector_is_saved(_label)==-1)
    {
        ds_grid_insert_row(recent_sector_grid,0);
        ds_grid_set(recent_sector_grid,0,0,_label);
        var _list = ds_list_create();
        //show_debug_message("Creating Enemy List.  Index: "+string(_list));
        ds_grid_set(recent_sector_grid,1,0,_list);
        
        //show_debug_message("Adding "+_label+" to the saved sector grid.");
        
        //Trim
        while(ds_grid_height(recent_sector_grid)>sector_limit)
        {
            show_debug_message("!!!!!!!!!!!!!!!Trimming grid.!!!!!!!!!!!!!!!!!!!!!!!!");
            var _list=ds_grid_get(recent_sector_grid,1,ds_grid_height(recent_sector_grid)-1);
            show_debug_message("Trimming Sector: "+string(ds_grid_get(recent_sector_grid,0,ds_grid_height(recent_sector_grid)-1)));
            //Destroy all the enemies that have expired.
            for(var i=0; i<ds_list_size(_list);i++)
                instance_kill(ds_list_find_value(_list,i)); 
                
            ds_list_destroy(_list); //Destroy enemy list.
            ds_grid_resize(recent_sector_grid,ds_grid_width(recent_sector_grid),ds_grid_height(recent_sector_grid)-1);
        }
    }
}