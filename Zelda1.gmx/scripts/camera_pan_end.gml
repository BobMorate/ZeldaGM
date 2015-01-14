///camera_pan_end()
//Ends a camera pan.
///Entered new sector.  Do stuff.
with(obj_world_manager)
{
    //Reset Pan
    pan_tween_x=noone;
    pan_tween_y=noone;
    is_panning=false;
    
    //Disable old enemies.
    sector_disable_enemies(previous_sector);
    //Move push blocks back and reset traps
    with(obj_push_block)
    {
        x=my_start_x;
        y=my_start_y;
        pushed=false;
    }
    
    with(obj_trap_door)
        event_user(0);
    with(obj_spike_trap_red)
    {
        x=my_start_x;
        y=my_start_y;
        state=STATES.WAIT;
        sprite_angle=0;
    }
        
    //Disable Collisions, Enable new collisions.
    map_disable_outside_collision();
    /*if(instance_exists(obj_enemy_master))
    {
        with(obj_enemy_master)
        {
            if(!point_in_rectangle(x,y,other.bound_left,other.bound_top,other.bound_right+screen_width,other.bound_bot+screen_height))
            {
                instance_deactivate_object(id); //Deactivate self if not in the current sector.
            }
        }
    }*/
    
    //Unfreeze actors
    if(instance_exists(obj_actor_master))
        obj_actor_master.is_frozen=false;
}