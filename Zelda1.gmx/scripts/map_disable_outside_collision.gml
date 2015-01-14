var _buffer = 0;

with(obj_world_manager)
{
    instance_activate_region_object(bound_left-_buffer,bound_top-_buffer,
                                    bound_right+screen_width+_buffer-1,
                                    bound_bot+screen_height+_buffer-1,
                                    obj_sector_activated);
}