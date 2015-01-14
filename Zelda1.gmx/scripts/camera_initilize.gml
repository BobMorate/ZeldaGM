///camera_initilize();
//Order of operations is VERY important in here...
//show_debug_message("ENTERED NEW ROOM, initilizing camera stuff");
camera_load_map();
current_sector=sector_get_label(obj_link.x,obj_link.y);

camera_get_bounds(obj_link.x,obj_link.y);
animated_tile_check_for_tile(bound_left,bound_right+screen_width,bound_top,bound_bot+screen_height);
camera_snap_to_bounds();
camera_position();
map_disable_outside_collision();
camera_get_collision(obj_link.x,obj_link.y);
//show_debug_message("Spawn monsters in new room.  Sector "+string(current_sector));
map_spawn_enemies(true);
with(obj_enemy_master)
{
    depth=-y;
    is_frozen=true;
}
sector_save(current_sector);
initilized=true;