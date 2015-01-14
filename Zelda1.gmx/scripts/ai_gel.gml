if(ai_state==ai_spawn)
{   //Snap to grid
    //show_debug_message("ai_octorock: Snapping to grid");
    
    actor_snap_to_grid(id);   
    var _dir=0;
    
    ai_state_next=ai_wait;
    state_switch("Stand");
    max_wait=1.5;
    //wait_length=1.5*room_speed;// random(max_wait)*room_speed;
    
}
if(ai_state==ai_wait)
{
    if(ai_timer==0)
        wait_length=random(max_wait)*room_speed;
    if(ai_timer>wait_length)
    {
        ai_state_next=ai_patrol;
        start_x=x;
        start_y=y;
        facing_direction=choose(east,west,north,south);
        ai_pick_destination();
        if(state_interruptable)
            state_switch("Jump");
    }
}