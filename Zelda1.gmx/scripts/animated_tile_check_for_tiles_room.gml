//animated_tile_check_for_tiles();
//Used in the "Room Start" event of the object controlling tile animations.
//Will toggle animation of tilesets that are present in the current room.
//Toggle all off.
aniamted_tile_disable_all();
//Determine whether there are tiles in the room that need to be animated
var xx=0;
var yy;
var ts=32; //Tile Size
repeat(ceil(room_width)/ts)
{
    yy=0;
    repeat(ceil(room_height)/ts)
    {
        var i=0;
        repeat(animtile_layers_count)
        {
            var tile=tile_layer_find(animtile_layers[i],xx*ts,yy*ts)
            if(tile != -1)
            {   ///Found an animting tile, but which background?
                var back = tile_get_background(tile);
                if(ds_grid_value_exists(animated_tiles,0,0,0,ds_grid_height(animated_tiles)-1,back))
                {   //Found the appropriate tileset, turning on animation.
                    var row=ds_grid_value_y(animated_tiles,0,0,0,ds_grid_height(animated_tiles)-1,back);
                    ds_grid_set(animated_tiles,1,row,true);
                }
            }
            i++;
        }
        yy++;
    }
    xx++;   
}