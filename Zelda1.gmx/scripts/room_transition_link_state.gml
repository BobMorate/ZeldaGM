///room_transition_link_state(transition ID, Target state)
//Will set link's state after a transition;
with(argument[0])
{
    change_state=true;
    new_state_key=argument[1];
}