//animated_tile_init()
//Initilize the tile animation system on the calling instance.
globalvar Animated_Tile_Level,Animated_Tile_Controller;
Animated_Tile_Controller=id;
animated_tile_set_level(5);
animtile_layers_count=0;
animated_tiles = ds_grid_create(30,0);
animtile_layers[0]=0;