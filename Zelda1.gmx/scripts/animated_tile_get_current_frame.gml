//returns the current frame for the animated tileset.
//Much like image_index for an animating sprite, this is increased by your animation speed every step.  
//So it could be 1.3 or it could be 389281.2.
return(ds_grid_get(animated_tiles,3,argument[0]));