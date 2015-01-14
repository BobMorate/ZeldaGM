///camera_position()
with(obj_world_manager)
{
    if(instance_exists(obj_link))
    {
        //Center On Link.
        x = obj_link.x - screen_width*.5;
        y = obj_link.y - screen_height*.5-8;
        
        
        //Stick to boundries   
        camera_snap_to_bounds();
        
        //Keep in Room
        x=clamp(x,0,room_width-screen_width);
        y=clamp(y,0,room_height-screen_height);
        
        //Update View Location
        view_xview=x;
        view_yview=y;
    }
}