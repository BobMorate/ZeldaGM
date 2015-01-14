///music_add(Key <string>, Path <string>, Loop <ms>, Length <ms>)
var _row=ds_grid_add_row(Music_Grid);
ds_grid_set(Music_Grid,music_path,_row,argument[1]);
ds_grid_set(Music_Grid,music_loop_start,_row,argument[2]);
ds_grid_set(Music_Grid,music_key,_row,argument[0]);
ds_grid_set(Music_Grid,music_resource,_row,noone);
ds_grid_set(Music_Grid,music_length,_row,argument[3]);