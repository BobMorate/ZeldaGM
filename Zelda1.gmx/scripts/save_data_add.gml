///save_data_add(key,change amount)
with(obj_game_manager)
{
    //show_debug_message("Adding "+string(argument[1])+" to "+argument[0]);
    if(ds_map_exists(save_data,argument[0]))
    {
        var current_value=ds_map_find_value(save_data,argument[0]);
        ds_map_replace(save_data,argument[0],current_value+argument[1]);
    }
}