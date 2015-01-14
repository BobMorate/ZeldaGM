//Build Grid
item_grid=ds_grid_create(7,0);
item_grid_add("Nothing",0,-1,0,99,"");
item_grid_add("Boomerang",10,spr_hud_boomerangs,0,1,"Boomerang");
if(save_data_get("Boomerang")==2)
    item_grid_set_sprite("Boomerang",spr_hud_boomerangs,1);
    
item_grid_add("Bombs"       ,10           ,spr_hud_bomb,0,1,"");
//Need sprites for all below
item_grid_add("Bow"         ,30           ,spr_bow_and_arrow,0,2,"Bow");
switch(save_data_get("Bow"))
{
    case 0: item_grid_set_sprite("Bow",0,0);break;
    case 1: item_grid_set_sprite("Bow",spr_bow_and_arrow,save_data_get("Arrow"));break;
    case 2: item_grid_set_sprite("Bow",spr_bow_and_arrow,2);break;
    case 3: item_grid_set_sprite("Bow",spr_bow_and_arrow,3);break;
}
//Lantern
show_debug_message("Lantern Value: "+string(save_data_get("Lantern")));
if(save_data_get("Lantern")==2)
{
    item_grid_add("Lantern",60,spr_hud_lantern,1,1,"");
}
else
{
    item_grid_add("Lantern",60*10,spr_hud_lantern,0,1,"");
}

item_grid_add("Ocarina"     ,30           ,spr_hud_bomb,0,1,"");
item_grid_add("Monster Bait",room_speed*30,spr_hud_bomb,0,1,"");
item_grid_add("Bottle"      ,room_speed   ,spr_hud_bomb,0,2,"");
item_grid_add("Wand"        ,30           ,spr_hud_bomb,0,1,"");