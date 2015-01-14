///link_update_palette()
var _pal = 1;
_pal+=3*save_data_get("Clothes");
if(save_data_get("Sword")>0)
_pal+=save_data_get("Sword")-1;
//show_debug_message("Setting pal to "+string(_pal));
obj_link.current_pal=_pal;