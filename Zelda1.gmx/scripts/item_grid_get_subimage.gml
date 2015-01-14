///item_grid_get_subimage(item index)
with(obj_game_manager)
{
    return(ds_grid_get(item_grid,item_subimage,argument[0]));
}