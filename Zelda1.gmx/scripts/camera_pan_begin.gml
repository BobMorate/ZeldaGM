///camera_pan_begin(instant?)
//Does everything needed for a camera pan.
//Freeze Actors
//show_debug_message("----BEGINING PAN [START]----");
with(obj_world_manager)
{
    if(instance_exists(obj_actor_master))
    {
        with(obj_actor_master)
            is_frozen=true;
    }
    
    //Freeze Projectiles
    if(instance_exists(obj_projectile))
    {
        with(obj_projectile)
        {
            if(team!=0)
                is_frozen=true;
        }
    }
    
    //save sector grid
    //show_debug_message("Saving current sector");
    sector_save(current_sector);
    sector_save_enemies(current_sector);
    previous_sector=current_sector;
    current_sector=sector_get_label(obj_link.x,obj_link.y);
    
    aniamted_tile_disable_all();
    animated_tile_check_for_tile(bound_left,bound_right+screen_width,bound_top,bound_bot+screen_height);
    
    
    //Get link's location and set bounds.
    camera_get_bounds(obj_link.x,obj_link.y);
    
    animated_tile_check_for_tile(bound_left,bound_right+screen_width,bound_top,bound_bot+screen_height)
    
    //Load Collision
    camera_get_collision(obj_link.x,obj_link.y);
    
    //Disable Collisions, Enable new collisions.
    //map_disable_outside_collision();
    instance_deactivate_object(obj_spawner);
    instance_activate_region(bound_left,
                             bound_top,
                             bound_right-bound_left+screen_width,
                             bound_bot-bound_top+screen_height,
                             true);
    
    //Check if sector is saved.
    map_spawn_enemies();
    
    //Camera Stuff
    is_panning=true;
    //Set variables for panning
    pan_start_x=x;
    pan_start_y=y;    
    camera_position(); //Temporarily snap to new bounds.
    pan_target_x=x;
    pan_target_y=y;    
    x=pan_start_x;
    y=pan_start_y;
    view_xview=x;
    view_yview=y;
    pan_tween_x=TweenCreate(id,true);
    pan_tween_y=TweenCreate(id,true);
    
    if(argument_count==0)
    {
        TweenPlayOnce(pan_tween_x,x__,pan_start_x,pan_target_x,pan_length,ease_type);
        TweenPlayOnce(pan_tween_y,y__,pan_start_y,pan_target_y,pan_length,ease_type);
    }
    else
    {
        TweenPlayOnce(pan_tween_x,x__,pan_start_x,pan_target_x,0,ease_type);
        TweenPlayOnce(pan_tween_y,y__,pan_start_y,pan_target_y,0,ease_type);
    }
    //show_debug_message("----BEGINING PAN [END]----");
}