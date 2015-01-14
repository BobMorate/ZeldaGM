///map_add_dungeon(room index, csv, bgm key <string>)
//Adds a new dungeon to the game.
//If it is a simple 1 screen dungeon, set argument 1 to "".


if(argument[1] == "")
{
    var _camera_grid=ds_grid_create(1,1);//,"1x1 Camera Bound Data for "+room_get_name(argument[0]),false);
    _map=ds_map_create();
    _camera_grid[# 0,0]=_map;
    ds_map_add(_map,"Label",string(argument[0])+":"+write_coordinates(0,0));
    ds_map_add(_map,"Bound Top",0);
    ds_map_add(_map,"Bound Left",0);
    ds_map_add(_map,"Bound Right",0);
    ds_map_add(_map,"Bound Bot",0);
    ds_map_add(_map,"Collision Grid",ds_grid_create(0,0));//"Collision Grid for "+room_get_name(argument[0])));
    
}
else
{
    var _room_grid=csv_to_ds_grid(argument[1],",")
    var _camera_grid = ds_grid_create(ds_grid_width(_room_grid),ds_grid_height(_room_grid));//,"Camera Bound Data for "+room_get_name(argument[0]),false);
    ds_grid_clear(_camera_grid,noone);
    
    //Iterate through World Map and populate camera grid with a map of camera bounderies. 
    for(var _x=0;_x<ds_grid_width(_room_grid);_x++)
    {
        for(var _y=0;_y<ds_grid_height(_room_grid);_y++)
        {
            if(_camera_grid[# _x,_y] == noone)
            {
                //Determine how large the current area is.
                var _width=1;
                var _height=1;
                
                while(string(_room_grid[# _x+_width, _y]) == _room_grid[# _x,_y])
                {
                    //show_debug_message("Comparing cell "+string(_x)+","+string(_y)+" to cell "+string(_x+_width)+","+string(_y));
                    _width++;
                }  
                while(string(_room_grid[# _x , _y+_height]) == _room_grid[# _x , _y])
                {
                    //show_debug_message("Comparing cell "+string(_x)+","+string(_y)+" to cell "+string(_x)+","+string(_y+_height));
                    //show_debug_message(string(_room_grid[# _x, _y])+ " =?= " +string(_room_grid[# _x, _y+_height]))
                    _height++;
                }
                
                //Determine camera bounds based on x, y, width, and height.
                var _btop,_bleft,_bright,_bbot;
                _btop=_y*screen_height;
                _bleft=_x*screen_width;
                _bright=(_x+_width-1)*screen_width;
                _bbot=(_y+_height-1)*screen_height;
                        
                for(var _i=0;_i<_width;_i++)
                {
                    for(var _ii=0;_ii<_height;_ii++)
                    {
                        //Set up the bounds map for each cell.
                        _map=ds_map_create();
                        _camera_grid[# _x+_i,_y+_ii]=_map;
                        ds_map_add(_map,"Label",string(argument[0])+":"+write_coordinates(_x,_y));
                        ds_map_add(_map,"Bound Top",_btop);
                        ds_map_add(_map,"Bound Left",_bleft);
                        ds_map_add(_map,"Bound Right",_bright);
                        ds_map_add(_map,"Bound Bot",_bbot);
                        ds_map_add(_map,"Collision Grid",ds_grid_create(0,0));//,"Collision Grid for sector: "+string(argument[0])+":"+write_coordinates(_x,_y),false));
                    }
                }
            }
        }
    }
    ds_grid_destroy(_room_grid);
}

///Save the map
ds_map_add(room_map,argument[0],_camera_grid);
ds_map_add(room_music_map,argument[0],argument[2]);