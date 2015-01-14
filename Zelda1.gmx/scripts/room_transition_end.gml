///room_transition_end()
//Resolves the room transition and cleans up
//show_debug_message("Transition Step 5: Cleanup ("+string(timeline_position)+")");
if(link_move)
{   //Unfreeze actors, restore control to Link
    with(obj_actor_master)
        is_frozen=false;
    with(obj_link)
    {
        actor_zero_controls(id);
        //state_switch("Stand");
        is_invincible=false;
        override_controls=false;
        ignore_room_boundries=false;
        ignore_view_transitions=false;
        ignore_collision=false;
    }
    
    var _tar=instance_find_tag(link_target_tag);
    with(obj_link)
    {
        //show_debug_message(string(timeline_position)+" - Moving again...")
        //state_switch("Stand");
        obj_link.override_depth=false;
        x=_tar.center_x;
        y=_tar.center_y;
    }
}

instance_kill(obj_transfx);
instance_destroy();