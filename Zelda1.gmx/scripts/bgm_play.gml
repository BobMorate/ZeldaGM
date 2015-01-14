///bgm_play(Name <string>,start at <ms optional>);
//Plays song, stops previous song if playing.
if(BGM != noone && FMODInstanceIsPlaying(BGM))
{   //Stop Previous
    FMODInstanceStop(BGM);
}

if(ds_grid_value_exists(Music_Grid,music_key,0,music_key,ds_grid_height(Music_Grid)-1,argument[0]))
{
    //show_debug_message("Trying to play '"+string(argument[0])+"'   Music Grid ("+string(Music_Grid)+") Height = "+string(ds_grid_height(Music_Grid)));
    var _row = ds_grid_value_y(Music_Grid,music_key,0,music_key,ds_grid_height(Music_Grid)-1,argument[0]);
    //Has the sound been loaded already?
    if(ds_grid_get(Music_Grid,music_resource,_row)==noone)
    {   //Load It
        var _obj_ref=FMODSoundAdd(ds_grid_get(Music_Grid,music_path,_row),false,true);
        if(_obj_ref>0)
            ds_grid_set(Music_Grid,music_resource,_row,_obj_ref);    
        else
            show_message("Adding Sound: "+FMODErrorStr(FMODGetLastError()));
    }
    else
        show_debug_message("Song already loaded previously.");
        
    var _sound=ds_grid_get(Music_Grid,music_resource,_row)
    
    //Get the sound's length
    var _length = ds_grid_get(Music_Grid,music_length,_row);
    if(!FMODSoundGetLength(_sound))
        show_message("Sound Length: "+FMODErrorStr(FMODGetLastError()));
    else
        _length=FMODSoundGetLength(_sound);
    
    
    if(!FMODSoundSetMaxVolume(_sound,BGM_Volume))
        show_message("Set Volume: "+FMODErrorStr(FMODGetLastError()));    
        
    BGM=FMODSoundPlay(_sound,true);
    if(!FMODInstanceSetLoopCount(BGM,-1))
        show_message("Set Loop Count: "+FMODErrorStr(FMODGetLastError()));
    //var _length = FMODIn (_BGM);
    
    if(_length>0)
    {
        if(!FMODInstanceSetLoopPoints(BGM,ds_grid_get(Music_Grid,music_loop_start,_row)/_length,1))
            show_message("Set Loop Points: "+FMODErrorStr(FMODGetLastError()));    
    }
    else
       show_message("Sound Length: "+FMODErrorStr(FMODGetLastError()));
    
    BGM=FMODSoundLoop(_sound,false);
    show_debug_message("Playing - "+argument[0]);
    if(BGM == 0)
        show_message("Play Sound: "+FMODErrorStr(FMODGetLastError()));
    else if(argument_count>1)
        FMODInstanceSetPosition(BGM,argument[1]/ds_grid_get(Music_Grid,music_length,_row));
}
else
{
    show_debug_message("Trying to play a non-existent song.");
    
    for(var _y=0;_y<ds_grid_height(Music_Grid);_y++)
    {
        var _msg="";
        for(var _x=0;_x<ds_grid_width(Music_Grid);_x++)
        {
            _msg+=string(ds_grid_get(Music_Grid,_x,_y));
            _msg+="    |    ";
        }
        show_debug_message(_msg);
    }
    show_debug_message("Trying to play '"+string(argument[0])+"'   Music Grid ("+string(Music_Grid)+") Height = "+string(ds_grid_height(Music_Grid)));
    show_debug_message(script_get_name(313));
    BGM = noone;
}