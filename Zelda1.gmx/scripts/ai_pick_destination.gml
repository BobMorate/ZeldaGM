///ai_pick_destination()
//picks a new point on the grid to walk to.
//show_debug_message("Current Position: "+write_coordinates(x,y));
var _cx=ai_get_sector_x();
var _cy=ai_get_sector_y();

if((x==ai_get_sector_point_x(_cx) && y==ai_get_sector_point_y(_cy)) || !ai_can_move(_cx,_cy))
{   //Am I already on a node, pick a new destination.
    var _dirs=ds_list_create();
    //Favor certain directions
    repeat(3)
    {  
        ds_list_add(_dirs,angle_normalize(facing_direction+90));
        ds_list_add(_dirs,angle_normalize(facing_direction-90))
    }
    repeat(5)
        ds_list_add(_dirs,facing_direction);
    repeat(1)
        ds_list_add(_dirs,angle_normalize(facing_direction+180));
    
    ds_list_shuffle(_dirs);
    do
    {
        var _d = ds_list_find_value(_dirs,0);
        var _mx=lengthdir_x(1,_d);
        var _my=lengthdir_y(1,_d);
        ds_list_delete(_dirs,0);   
        ai_decision=_d;
        //show_debug_message("Checking "+write_coordinates(_cx+_mx,_cy+_my));
    }until(ai_can_move(_cx+_mx,_cy+_my) || ds_list_size(_dirs)==0);
    
    ai_destination_x=ai_get_sector_point_x(_cx+_mx);
    ai_destination_y=ai_get_sector_point_y(_cy+_my);
    //show_debug_message("New Destination: "+write_coordinates(ai_destination_x,ai_destination_y));
}
else
{   //Just go towards the center
    ai_destination_x=ai_get_sector_point_x(_cx);
    ai_destination_y=ai_get_sector_point_y(_cy);
    //show_debug_message("My Coordinates: "+write_coordinates(x,y)+"  Current Sector Node Destination: "+write_coordinates(ai_destination_x,ai_destination_y));
}



