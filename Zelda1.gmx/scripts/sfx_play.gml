///sfx_play(sound key,loop?)
if(ds_grid_value_exists(Sound_Grid,sound_key,0,sound_key,ds_grid_height(Sound_Grid)-1,argument[0]))
{
    var _row = ds_grid_value_y(Sound_Grid,sound_key,0,sound_key,ds_grid_height(Sound_Grid)-1,argument[0]);
    var _sound=ds_grid_get(Sound_Grid,sound_resource,_row);
    
    
    
    if(argument_count>1 && argument[1])
        var _sfx=FMODSoundLoop(_sound,false);
    else
        var _sfx=FMODSoundPlay(_sound,false);

    FMODInstanceSetVolume(_sfx,SFX_Volume);
    return(_sfx);
}