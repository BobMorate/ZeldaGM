///Animates the tiles
with(Animated_Tile_Controller)
{
    var i=0;
    repeat(ds_grid_height(animated_tiles))
    {   //Iterate through all animated tile sets.
        if(animated_tile_is_playing(i) && Animated_Tile_Level >= animated_tile_get_priority(i)) //Check if it is playing AND has a lower priority than the current prioirty threshold.
        {   //The Tileset is animating and below the priority threshold.
            ds_grid_add(animated_tiles,3,i,animated_tile_get_animation_speed(i)) //Inc the frame
            if(floor(animated_tile_get_current_frame(i)) >= animated_tile_get_next_frame(i)) //Check to see if current frame is a higher number than the last frame.
            {   //We need to update the tiles.
                ds_grid_add(animated_tiles,4,i,1); //Inc "Next Frame" for the previous if statement.
                background_assign(animated_tile_get_background(i),animated_tile_get_current_background(i));
            }
        }
        i++;
    }
}