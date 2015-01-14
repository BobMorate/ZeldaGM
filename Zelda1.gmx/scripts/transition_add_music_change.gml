///transition_add_music_change(transition id,Room Song?, If Not; song, Start Position)
with(argument[0])
{
    music_change=true;
    if(!argument[1] && argument_count>2)
    {
        new_song=argument[2];
        if(argument_count>3)
            new_song_position=argument[3];
    }
    else
    {
        use_room_song=true;
        //show_message("Target Room: "+string(room_get_name(target_room)));
        new_song=ds_map_find_value(obj_world_manager.room_music_map,target_room);
    }
    
    ///Check to make sure the new song isn't the song already playing.
    var _sound=FMODInstanceGetSound(BGM);
    
    var _row=ds_grid_value_y(Music_Grid,music_resource,0,music_resource,ds_grid_height(Music_Grid)-1,_sound);
    var _key=ds_grid_get(Music_Grid,music_key,_row);
    //show_message("_sound: "+string(_sound)+"  _row: "+string(_row)+" _key: "+string(_key)+"  new song: "+string(new_song));
    if(_key=new_song)
        music_change=false;
}