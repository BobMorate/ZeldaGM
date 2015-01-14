///item_shift_equipped(1 or -1)
//Shifts the currently equipped item if possible.
with(obj_game_manager)
{
    var _current = save_data_get("Item");
    if(sign(argument[0])==1)
    {   //Move up
        repeat(ds_grid_height(item_grid))
        {
            _current+=1;
            if(_current==ds_grid_height(item_grid)) //Wrap
                _current=0;
            var _key=item_grid[# item_key,_current];
            var _min=item_grid[# item_min_value,_current];
            /*show_debug_message("Key: "+string(_key)+
                               "  Value: "+string(save_data_get(_key))+
                               "  Min Value: "+string(_min));*/
                               
            if(_min <= save_data_get(_key))
            {   //can equip this one.  Equip it, break out.
                save_data_set("Item",_current);
                return(1);
            }
        }
    }
    else if(sign(argument[0])==-1)
    {
        repeat(ds_grid_height(item_grid))
        {   //Move down
            _current-=1;
            if(_current<0) //Wrap
                _current=ds_grid_height(item_grid)-1;
            
            var _key=item_grid[# item_key,_current];
            var _min=item_grid[# item_min_value,_current];
            /*show_debug_message("Key: "+string(_key)+
                               "  Value: "+string(save_data_get(_key))+
                               "  Min Value: "+string(_min));*/
                               
            if(_min <= save_data_get(_key))
            {   //can equip this one.  Equip it, break out.
                save_data_set("Item",_current);
                return(1);
            }
        }
    }
}