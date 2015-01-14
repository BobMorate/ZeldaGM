///animated_tile_add(background,speed,priority,animated_sprite);
///Add a tile set to the animated tile system.
with(Animated_Tile_Controller)
{
    spr=argument[3];
    ds_grid_resize(animated_tiles,ds_grid_width(animated_tiles),ds_grid_height(animated_tiles)+1)
    var row=ds_grid_height(animated_tiles)-1;
    ds_grid_set(animated_tiles,0,row,argument[0]); //Set background file
    ds_grid_set(animated_tiles,1,row,true); //Set whether it is playing or not
    ds_grid_set(animated_tiles,2,row,argument[1]); //Set the animation speed.
    ds_grid_set(animated_tiles,3,row,0); //Set the current animation frame.
    ds_grid_set(animated_tiles,4,row,1); //Set the "next animation frame.
    ds_grid_set(animated_tiles,5,row,argument[2]);  //Set the priority for the animated tile.
    ds_grid_set(animated_tiles,6,row,sprite_get_number(spr)); //How many frames do we have?
    ///Set Up Frames
    var i=0;
    var s = surface_create(sprite_get_width(spr),sprite_get_height(spr));
    surface_set_target(s);
    repeat(sprite_get_number(spr))
    {
        draw_clear_alpha(c_black,0);
        draw_sprite(spr,i,0,0);
        ds_grid_set(animated_tiles,7+i,row,background_create_from_surface(s,0,0,sprite_get_width(spr),sprite_get_height(spr),false,false));  //Set the backgrounds that serve as the background frames.
        i++;
    }
    surface_reset_target();   
}