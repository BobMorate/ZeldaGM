///room_transition_switch_room
//Switches the room.
//show_debug_message("Transition Step 2: Change Rooms ("+string(timeline_position)+")");
if(change_room && target_room!=noone)
{
    with(obj_actor_master)
    {
        if(!persistent)
            instance_destroy();
    }
    
    room_goto(target_room);
}