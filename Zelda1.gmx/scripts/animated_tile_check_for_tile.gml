//animated_tile_check_for_tiles(left,right,top,bot);
//screen size is not automatically added to the right and bot arguments.
//Used when the camera begins to pan to a new sector.
//Scans given sector and animates appropriate tiles.

//Determine whether there are tiles in the room that need to be animated
var xx=0;
var yy;
var ts=8; //Tile Size

var _left,_right,_top,_bot,_x,_y,_i;
_left=argument[0];
_right=argument[1];
_top=argument[2];
_bot=argument[3];

for(_x=_left; _x<_right;_x+=ts)
{
    for(_y=_top; _y<_bot;_y+=ts)
    {
        for(_i=0;_i<animtile_layers_count;_i++)
        {
            var _tile=tile_layer_find(animtile_layers[_i],_x,_y)
            if(_tile != -1)
            {   ///Found an animting tile, but which background?
                var _back = tile_get_background(_tile);
                if(ds_grid_value_exists(animated_tiles,0,0,0,ds_grid_height(animated_tiles)-1,_back))
                {   //Found the appropriate tileset, turning on animation.
                    var _row=ds_grid_value_y(animated_tiles,0,0,0,ds_grid_height(animated_tiles)-1,_back);
                    ds_grid_set(animated_tiles,1,_row,true);
                }
            }
        }
    }
}

/*
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