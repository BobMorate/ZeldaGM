///item_grid_get_cooldown(item index)
with(obj_game_manager)
{
    return(ds_grid_get(item_grid,item_current_cooldown,argument[0]));
}