///actor_in_sector(id)
var _id=argument[0];
with(obj_world_manager)
{
    return(_id.x>bound_left && 
           _id.x<bound_right+screen_width &&
           _id.y>bound_top &&
           _id.y<bound_bot+screen_height);
}