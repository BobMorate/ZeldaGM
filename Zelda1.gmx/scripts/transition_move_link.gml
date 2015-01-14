///transition_move_link(transition id, out state, out direction, in target tag, in state, in direction, ignore collision)
with(argument[0])
{
    link_move=true;
    link_out_state=argument[1];
    link_out_direction=argument[2];

    link_target_tag=argument[3];
            
    link_in_state=argument[4];
    link_in_direction=argument[5];

    link_ignore_collision=argument[6];
}