///Link's push state
if(state_new)
{
    shield_visible=false;
    image_speed=.15;
    var _wall=instance_place(x+lengthdir_x(1,facing_direction),y+lengthdir_y(1,facing_direction),obj_push_block);
    if(_wall != noone && !_wall.locked && _wall.x==_wall.my_start_x && _wall.y==_wall.my_start_y)
    {   //Push block
        _wall.pushed=true;
        _wall.move_direction=facing_direction;
        sfx_play("Push",false);
    }
}

if(!any_direction())
{
    state_switch("Stand");
}
else
{
    read_direction_controls();
    if(point_direction(0,0,x_speed,y_speed) != facing_direction)
        state_switch("Walk");
}