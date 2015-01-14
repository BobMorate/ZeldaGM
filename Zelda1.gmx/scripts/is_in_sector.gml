///is_in_sector(x,y)
var _x = argument[0];
var _y = argument[1];
with(obj_world_manager)
{
    return(_x>bound_left && _x<bound_right+screen_width && _y>bound_top && _y<bound_bot+screen_height);
}