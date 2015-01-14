//save_files_init();
if(!file_exists("Save1.sav"))
{
    ds_map_secure_save(save_data,"Save1.sav");
}
if(!file_exists("Save2.sav"))
{
    ds_map_secure_save(save_data,"Save2.sav");
}
if(!file_exists("Save3.sav"))
{
    ds_map_secure_save(save_data,"Save3.sav");
}

//System Settings
globalvar System_Settings;

if(!file_exists("Settings.sav"))
{
    System_Settings=ds_map_create();
    ds_map_add(System_Settings,"BGM Volume",.5);
    ds_map_add(System_Settings,"SFX Volume",.5);
    ds_map_add(System_Settings,"Screen Scale",1);
    ds_map_secure_save(System_Settings,"Settings.sav");
    
}
else
{   //Load Options
    System_Settings=ds_map_secure_load("Settings.sav");
}