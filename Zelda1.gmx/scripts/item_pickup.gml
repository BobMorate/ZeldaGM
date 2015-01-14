///item_pickup();
if(!picked_up)
{
    var _can_pick_up=false;
    if(cost>0 && save_data_get("Rupees")>=cost)
    {   //This is a shop item and you can afford it.
        if((destroy_if_worse && save_data_get(key)<value) || !destroy_if_worse)
        {   //This item is better than what you have or doesn't care.
            _can_pick_up=true;
            save_data_add("Rupees",-cost);
            if(show_text_shop)
                show_text=true;
        }
    }
    else if(cost==0)
    {   //Regular ground Pickup Are we at max?
        var _count=save_data_get(key);
        if(_count<save_get_max(key) || override_max)
        {
            _can_pick_up=true;
        }
    }
    else
    {   //For some reason, you can't pick this shit up.  Play a sound or something to indicate the player can't purchase this.
        
    }
    
    
    if(_can_pick_up)
    {
        picked_up=true;
        if(show_text)
        {
            draw_shadow=false;
            other.item=id;
            with(other)
                state_switch("Item Get");

        }
        else
        {   //Just make it disapear
            sfx_play(pickup_sound);
            save_data_set(key,save_data_get(key)+value);
            save_data_set(key,clamp(save_data_get(key),0,save_get_max(key)));
            TweenPlayOnce(TweenCreate(id,true),z__,0,20,.5,EaseOutQuint);
            TweenPlayOnceDelay(TweenCreate(id,true),image_alpha__,1,0,.25,EaseOutCubic,.5);
            alarm[0]=room_speed*.75;
        }
    }
    
}