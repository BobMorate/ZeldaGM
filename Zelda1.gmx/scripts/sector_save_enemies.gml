///sector_save_enemies(sector label)
//Saves the current enemy list, destroys old list if it still exists.
var _row=sector_is_saved(argument[0]);
//show_debug_message("Saving current sector enemies to row "+string(_row));
if(_row>-1)
{
    var _grid = ds_grid_get(recent_sector_grid,1,_row);
    //show_debug_message("Loading Enemy List, Index: "+string(_list));
    ds_grid_destroy(_grid);
    _grid=ds_grid_create(enemy_grid_width,0);
    ds_grid_set(recent_sector_grid,1,_row,_grid);
    with(obj_enemy_master)
    {
        var _row = ds_grid_add_row(_grid);
        ds_grid_set(_grid,enemy_grid_type,_row,object_index);
        ds_grid_set(_grid,enemy_grid_x,_row,x);
        ds_grid_set(_grid,enemy_grid_y,_row,y);
        ds_grid_set(_grid,enemy_grid_direction,_row,facing_direction);
    }
}
else
    show_debug_message("Oh shit! Trying to save an enemy list for a sector that hasn't been saved...");