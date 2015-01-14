//aniamted_tile_disable_all()
//Disables all tile animation.  
with(Animated_Tile_Controller)
{
    var i=0;
    repeat(ds_grid_height(animated_tiles))
    {
        ds_grid_set(animated_tiles,1,i,false);
        i++;
    }
}