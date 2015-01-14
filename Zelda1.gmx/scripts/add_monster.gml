///add_monster(grid based,object)
if(argument[0])
{
    ds_list_add(monster_list_grid,argument[1]);
}
else
{
    ds_list_add(monster_list_free,argument[1]);
}