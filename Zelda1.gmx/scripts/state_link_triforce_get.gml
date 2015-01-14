///state_link_triforce_get
if(state_new)
{
    ///Freeze Everyone but Link
    z=0;
    facing_direction=south;
    with(obj_actor_master)
        is_frozen=true;
    obj_link.is_frozen=false;
    shield_visible=false;
    if(instance_exists(item))
    {
        item.x=round(x);
        item.y=round(y);
        item.depth=depth-1;
        TweenPlayOnce(TweenCreate(item,true),y__,y-10,y-25,1,EaseOutQuad);
        bgm_play_once("Dungeon Complete");
        
        //Save
        save_data_set("Triforce",bit_set(save_data_get("Triforce"),item.my_level-1,true));
    }
    state_interruptable=false;
    
    timeline_index=tml_link_triforce_get;
    timeline_position=0;
    timeline_running=true;
    
    if(instance_exists(obj_fx_fog))
        obj_fx_fog.fade_speed=.01;
}