///save_data_init();
save_data=ds_map_create();

//Link's inventory
ds_map_add(save_data,"Name","Link");
ds_map_add(save_data,"Rupees",100);
ds_map_add(save_data,"Keys",0);
ds_map_add(save_data,"Triforce",0); //Bianary Values (use bit_set)

ds_map_add(save_data,"Heart Pieces",0);
ds_map_add(save_data,"Heart Containers",3);

ds_map_add(save_data,"Compass",0); //Bianary Values
ds_map_add(save_data,"Maps",0);    //Bianary Values (use bit_set) to change.

ds_map_add(save_data,"Sword",1);
ds_map_add(save_data,"Shield",1);
ds_map_add(save_data,"Clothes",0);

ds_map_add(save_data,"Bomb Bag",0);
ds_map_add(save_data,"Wallet",0);
ds_map_add(save_data,"Gloves",0);
ds_map_add(save_data,"Boots",0);
ds_map_add(save_data,"Book",0);
ds_map_add(save_data,"Master Key",0);
ds_map_add(save_data,"Flippers",0);
ds_map_add(save_data,"Feather",0);
ds_map_add(save_data,"Magnet",1);

ds_map_add(save_data,"Item",0); //The index of the currently equipped item.
ds_map_add(save_data,"Bombs",0);
ds_map_add(save_data,"Boomerang",0);
ds_map_add(save_data,"Bow",0);
ds_map_add(save_data,"Arrow",0);
ds_map_add(save_data,"Lantern",0);
ds_map_add(save_data,"Wand",0);
ds_map_add(save_data,"Monster Bait",0);
ds_map_add(save_data,"Ocarina",0);
ds_map_add(save_data,"Bottle",0);
ds_map_add(save_data,"Echo",0);

item_grid_init();
