///room_transition_new_room()
//To be called the first step of the new room.
//Disables actors, calculates links position, etc.
//show_debug_message("3. Timeline Position: "+string(timeline_position));
//show_debug_message("Transition Step 3: New Room ("+string(timeline_position)+")");
if(in_effect != noone)
{
    //instance_kill(obj_transfx);
    in_effect=instance_create(0,0,in_effect);
    in_effect.length=in_length;
    in_effect.delay=wait_length;
    if(is_string(in_target_tag))
        in_effect.target=instance_find_tag(in_target_tag);
    else
        in_effect.target=in_target_tag;
        
    if(out_effect!=noone)
        instance_kill(out_effect);
}
if(link_move)
{
    
    show_debug_message(string(timeline_position)+" - Moving Link...");
    var _tar=instance_find_tag(link_target_tag);
    obj_link.x=_tar.center_x;
    obj_link.y=_tar.center_y;
    
    if(change_room)
    {
        with(obj_world_manager)
        {
            current_sector=sector_get_label(obj_link.x,obj_link.y);
            camera_initilize();
        }
    }
    else
    {
        camera_pan_begin();
        camera_pan_end();
    }
    if(link_in_direction != -1)
    {
        var _dist;
        with(obj_link)
        {
            _dist=state_get_speed(state_get_script(other.link_in_state));
            actor_zero_controls(id);
        }
        _dist=_dist*in_length;
        //show_debug_message("Link in State "+string(link_in_state));
        show_debug_message("Distance "+string(_dist));
        obj_link.x=obj_link.x+lengthdir_x(_dist,link_in_direction+180);
        obj_link.y=obj_link.y+lengthdir_y(_dist,link_in_direction+180);
    }
}
else if(change_room)
{
    with(obj_world_manager)
        camera_initilize();
}