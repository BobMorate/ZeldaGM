///environment_check_for_rain();
//Check for rain
/*if(state_timer mod 30==0 && irandom(50)==1)
{   ///Go to Rain state
    //state_next=States.Transition;
//    target_state=States.Rain;
    next_color=environment_state_get_color(States.Rain);
    current_color=environment_state_get_color(state);
    
    previous_state=state;
    previous_color=current_color;
    previous_timer=state_timer;
}