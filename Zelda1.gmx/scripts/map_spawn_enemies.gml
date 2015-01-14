///map_spawn_enemies(clear all);
if(sector_is_saved(current_sector) > -1)
{
    //show_debug_message("Enabling old enemies.");
    with(obj_spawner)
        active=false;
    sector_enable_enemies(current_sector);
    with(obj_enemy_master)
    {
        //show_debug_message("Freezing old enemies");
        is_frozen=true;
    }
}
else
{
    //Enable spawners to do their thing.
    if(argument_count>0 && argument[0])
            instance_kill(obj_enemy_master);
    show_debug_message("Enabling local Spawner if it exists.");
    instance_deactivate_object(obj_spawner);
    instance_activate_region(bound_left,
                             bound_top,
                             bound_right-bound_left+screen_width,
                             bound_bot-bound_top+screen_height,
                             true);
    with(obj_spawner)
        active=true;
    //instance_activate_region_object(bound_left,bound_top,bound_right+screen_width,bound_bot+screen_height,obj_spawner);
}