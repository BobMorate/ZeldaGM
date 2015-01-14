///ai_pick_direction()
//show_debug_message("AI: Picking a direction")
var _dirs = ds_list_create();
x=round(x);
y=round(y);
ds_list_add(_dirs,north,south,east,west);
repeat(3)
    ds_list_add(_dirs,facing_direction); //Gives an increased chance to continue moving/attacking forward.
ds_list_shuffle(_dirs);
var _cx,_cy,_mx,_my,_stuck;
_cx = ai_get_sector_x();
_cy = ai_get_sector_y();
ai_decision=east;
//show_debug_message("Current grid sector: "+write_coordinates(_cx,_cy));
do
{
    var _d = ds_list_find_value(_dirs,0);
    _mx=lengthdir_x(1,_d);
    _my=lengthdir_y(1,_d);
    ds_list_delete(_dirs,0);   
    ai_decision=_d;
    //show_debug_message("Checking "+write_coordinates(_cx+_mx,_cy+_my));
}until(ai_can_move(_cx+_mx,_cy+_my) || ds_list_size(_dirs)==0);
ds_list_destroy(_dirs);


ai_destination_x=x+_mx*tile_size;//+grid_xoff;
ai_destination_y=y+_my*tile_size;//+grid_yoff;
//show_debug_message("AI: Moving from "+write_coordinates(x,y)+" to "+write_coordinates(ai_destination_x,ai_destination_y));