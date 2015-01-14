///damage_link(damage)
//Hit's link for X damage, to be reduced by armor
var _dam = argument[0];

switch(save_data_get("Clothes"))
{
    case 0: break;
    case 1: _dam*=.5;
    case 2: _dam*=.25;
}
show_debug_message("Link Damaged - State Timer: "+string(state_timer)+"  State: "+script_get_name(state));
obj_link.hit_points-=_dam;