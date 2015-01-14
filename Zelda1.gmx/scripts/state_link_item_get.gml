///Link just picked up an item.
if(state_new)
{
    ///Freeze Everyone but Link
    z=0;
    facing_direction=south;
    with(obj_actor_master)
        is_frozen=true;
    obj_link.is_frozen=false;
    shield_visible=true;
    shield_direction=west;
    shield_yoff=4;
    shield_xoff=1;
    if(instance_exists(item))
    {
        item.x=round(x+5);
        item.y=round(y);
        item.depth=depth-1;
        TweenPlayOnce(TweenCreate(item,true),y__,y-10,y-25,1,EaseOutQuad);
        sfx_play(item.my_sound);
    }
    state_interruptable=false;
}
if(!instance_exists(item))
    state_switch("Stand");
else if(state_timer>=room_speed )
{   
    if(state_timer==room_speed)
    {
        my_textbox=instance_create(0,0,obj_ui_textbox);
        textbox_set_text(my_textbox,item.flavor_text);
    }
    
    if(!instance_exists(my_textbox))
    {   //Wrap this up.
        with(item)
            event_user(0);//Let the item do its thing.
        item=instance_kill(item);
        my_textbox=noone;
        state_switch("Stand");
        with(obj_actor_master)
            is_frozen=false;
    }
    else
    {
        if(actor_any_face_button_pressed())
        {
            my_textbox.proceed=true;
        }
    }
    
}

    