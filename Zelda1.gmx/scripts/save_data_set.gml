///save_data_set(key,value)
with(obj_game_manager)
{
    if(ds_map_exists(save_data,argument[0]))
        ds_map_replace(save_data,argument[0],argument[1]);
}