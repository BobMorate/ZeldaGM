///room_transition_init()
//This is the first step in the transition timeline.
//show_debug_message("1. Timeline Position: "+string(timeline_position));
//show_debug_message("Transition Step 1: Init ("+string(timeline_position)+")");
//Out Transition Effect
if(out_effect != noone)
{
    instance_kill(obj_transfx);
    out_effect=instance_create(0,0,out_effect);
    out_effect.length=out_length;
    if(is_string(out_target_tag))
        out_effect.target=instance_find_tag(out_target_tag);
    else
        out_effect.target=out_target_tag;
}

//Link Move Stuff
if(link_move && instance_exists(obj_link))
{
    //show_message("Yup, we are moving link")
    ///Disable controls
    with(obj_actor_master)
        is_frozen=true;
    with(obj_link)
    {
        if(other.link_out_state != "")
            state_switch(other.link_out_state);
        image_speed=.3;
        is_invincible=true;
        override_controls=true;
        ignore_room_boundries=true;
        ignore_view_transitions=true;
        ignore_collision=other.link_ignore_collision;

        actor_zero_controls(id);
        if(other.link_out_direction != -1)
        {
            is_frozen=false;
            switch(other.link_out_direction)
            {
                case east: button_right=true;break;
                case west: button_left=true;break;
                case north: button_up=true;break;
                case south: button_down=true;break;
            }
        }
    }
    with(obj_world_manager)
    {
        sector_save(current_sector);
        sector_save_enemies(current_sector);
        previous_sector=current_sector;
    }
    
    ///Fade Rain SFX
    var _obj=obj_outside_environment_manager;
    if(FMODInstanceGetVolume(_obj.rain_sfx)>0)
    {
        show_debug_message("Fading Rain SFX");
        FMODInstanceFadeVolume(_obj.rain_sfx,FMODInstanceGetVolume(_obj.rain_sfx),0,30);
    }
}

//Music change stuff
if(music_change)
{
    FMODInstanceFadeVolume(BGM,BGM_Volume,0,out_length*room_speed);
}