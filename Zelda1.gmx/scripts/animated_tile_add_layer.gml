//animated_tile_add_layer(Tile Layer Depth)
//Adds a layer to the animated tile system.  
//This layer is scanned for animating tiles at the beginning of each room.
with(Animated_Tile_Controller)
{
    animtile_layers[animtile_layers_count]=argument[0];
    animtile_layers_count++;
}