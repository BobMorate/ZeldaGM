///room_transition_move_link(transition ID, target tag,walk_direction,ignore_collision);
with(argument[0])
{
    
    link_move=true;
    link_move_target_tag=argument[1];
    link_move_direction=argument[2];
    var _ignore=true;
    if(argument_count>3)
        _ignore=argument[3];
        
    if(_ignore)
    {
        with(obj_link)
        {
            override_controls=true;
            ignore_collision=true;
            ignore_room_boundries=true;
            ignore_view_transitions=true;
            actor_zero_controls(obj_link);
        }
    }
}