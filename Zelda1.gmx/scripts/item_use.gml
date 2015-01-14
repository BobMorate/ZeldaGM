///item_use()
var _use_item=false;
var _state="";
var _item=save_data_get("Item");
var _key;
with(obj_game_manager)
{
    _key=item_grid[# item_key,_item];
    //Do you have this item?  Is it on cooldown?
    if(save_data_get(_key)>=item_grid[# item_min_value,_item] &&
       item_grid[# item_current_cooldown,_item]==0)
    {   //You can use it.
        _use_item=true;
        _state=item_grid[# item_state,_item];
        item_grid[# item_current_cooldown,_item]=item_grid[# item_cooldown,_item]; //Set cooldown
    }
}    
///Special Cases
if(_use_item)
{
    switch(_key)
    {
        case "Boomerang":   if(instance_exists(my_boomerang))
                                _use_item=false;
                            break;
        case "Bombs":   var _bomb=instance_create(x+lengthdir_x(16,facing_direction),y+lengthdir_y(16,facing_direction),obj_bomb);
                        with(_bomb)
                        {
                            var i=0;
                            while(place_meeting(x,y,obj_wall) && i<16)
                            {
                                x=x+lengthdir_x(1,other.facing_direction-180);
                                y=y+lengthdir_y(1,other.facing_direction-180);
                                i++;
                            }
                        }
                        _bomb.team=0;
                        _use_item=false;
                        save_data_add(_key,-1);
                        break;
        case "Bow": if(save_data_get("Rupees")>0)
                    {
                        save_data_add("Rupees",-1);
                    }
                    else
                    {
                        sfx_play("Error",false);
                        _use_item=false;
                    }
                    break;
        case "Lantern": var _flame = instance_create(x+lengthdir_x(16,facing_direction),y+lengthdir_y(16,facing_direction),obj_fx_flame_big);
                        _flame.depth=-_flame.y;
                        break;
    }
}   
if(_use_item)
    state_switch(_state);
//else
//    sfx_play("Error",false);