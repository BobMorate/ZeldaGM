///room_transition_in_start()
//Starts new music, in transition effect, link's movement if necessary, etc.
//show_debug_message("4. Timeline Position: "+string(timeline_position));
//show_debug_message("Transition Step 4: Start In ("+string(timeline_position)+")");

//Start new music
if(music_change)
{
    if(new_song != "")
        bgm_play(new_song,new_song_position);
}

//Move Link
with(obj_enemy_master)
    is_frozen=true;
if(link_move)
{
    if(link_in_direction != -1)
    {
        with(obj_link)
        {
            is_frozen=false;
            state_switch(other.link_in_state);
            actor_zero_controls(id);
            switch(other.link_in_direction)
            {
                case east: button_right=true;break;
                case west: button_left=true;break;
                case north: button_up=true;break;
                case south: button_down=true;break;
            }
        }
    }
    else
    {
        //if(link_in_state == "Death")
        //    show_debug_message(string(timeline_position)+" - Dying...");
        with(obj_link)
        {
            //show_debug_message("Switching to "+string(other.link_in_state));
            state_switch(other.link_in_state,true);
            obj_link.image_speed=.3;
        }
    }
}