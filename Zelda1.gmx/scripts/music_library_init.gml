///music_library_init()
//instantiates the music library system.
//Create list of music with appropriate loop points
globalvar BGM,Music_Grid;
BGM=noone;

//Music Grid
Music_Grid = ds_grid_create(5,0);
music_add("Overworld","BGM\bgm_overworld.mp3",7283,42318); //bgm_overworld.mp3
music_add("Opening Theme","BGM\bgm_theme.mp3",0,79908);
music_add("Dungeon","BGM\bgm_dungeon.mp3",32600,73299);
music_add("Fairy","BGM\bgm_fairy.mp3",2587,26420); //l: 26436
music_add("Dungeon Complete","BGM\bgm_level_complete.mp3",0,0);