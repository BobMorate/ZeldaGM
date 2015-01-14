///saved_object_load(object tag)
//returns the stored value.
with(obj_game_manager)
{
    if(ds_map_exists(save_data,argument[0]))
        return(ds_map_find_value(save_data,argument[0]));
}