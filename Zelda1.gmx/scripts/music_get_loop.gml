///music_get_loop(song key)
if(ds_grid_value_exists(Music_Grid,music_key,0,music_key,ds_grid_height(Music_Grid),argument[0]))
{
    var _row = ds_grid_value_y(Music_Grid,music_key,0,music_key,ds_grid_height(Music_Grid),argument[0]);
    return(Music_Grid[# music_loop_start,_row]);
}
