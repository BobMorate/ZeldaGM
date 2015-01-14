///item_grid_set_sprite(key,sprite index, subimage)
with(obj_game_manager)
{
    if(ds_grid_value_exists(item_grid,item_key,0,item_key,ds_grid_height(item_grid)-1,argument[0]))
    {
        var _row = ds_grid_value_y(item_grid,item_key,0,item_key,ds_grid_height(item_grid)-1,argument[0]);
        ds_grid_set(item_grid,item_sprite,_row,argument[1]);
        ds_grid_set(item_grid,item_subimage,_row,argument[2]);
    }
}