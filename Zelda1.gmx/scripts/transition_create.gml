///transition_create(out length <steps>, wait length<steps>, in length<steps>)
var _inst=instance_create(0,0,obj_room_transition_manager);
with(_inst)
{
    //General
    out_length=argument[0];
    wait_length=argument[1];
    in_length=argument[2];
    
    ///Build timeline
    timeline=timeline_add();
    
    timeline_clear(timeline);
    timeline_moment_add_script(timeline,out_length+3+wait_length+in_length,room_transition_end);
    timeline_moment_add_script(timeline,out_length+3+wait_length,room_transition_in_start);
    timeline_moment_add_script(timeline,out_length+3,room_transition_new_room);
    timeline_moment_add_script(timeline,out_length+2,room_transition_switch_room);
    timeline_moment_add_script(timeline,1,room_transition_init);
    
    
    //show_debug_message("Timeline Last Moment: "+string(timeline_max_moment(timeline)))
    
    timeline_index=timeline;
    timeline_position=0;
    timeline_speed=1;
    timeline_running=true;
    
}
return(_inst);