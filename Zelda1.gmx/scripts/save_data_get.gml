///save_data_get(key)
with(obj_game_manager)
{
    if(ds_map_exists(save_data,argument[0]))
        return(ds_map_find_value(save_data,argument[0]));
}