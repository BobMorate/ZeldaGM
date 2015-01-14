//animated_tile_get_current_background(set row index);
//returns the correct background for the current frame of the animation.
var cf;
cf = animated_tile_get_current_frame(argument[0]); //Current Frame
fc = animated_tile_get_frame_count(argument[0]); //Frame Count
if(cf>fc)
    cf=floor(cf-(fc*(cf div fc)));
else
    cf=floor(cf);
return(ds_grid_get(animated_tiles,7+cf,argument[0]));