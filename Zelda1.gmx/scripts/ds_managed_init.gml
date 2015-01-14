//ds_managed_init()
//Initilizes the DS Management System for tracking all created Grids, Lists, and Maps.
globalvar DS_Grid_Managed,DS_List_Managed,DS_Map_Managed;
DS_Grid_Managed = ds_grid_create(3,0);
DS_List_Managed = ds_grid_create(3,0);
DS_Map_Managed = ds_grid_create(3,0);
show_debug_message("DS Management System Initilized");