///recent_sector_clear(rebuild?)
//Clean up recent_sector_grid
for(var i=0; i<ds_grid_height(recent_sector_grid);i++)
{
    var _grid = ds_grid_get(recent_sector_grid,1,i);
    ds_grid_destroy(_grid);
}
ds_grid_destroy(recent_sector_grid);

if(argument_count>0 && argument[0])
{
    recent_sector_grid=ds_grid_create(2,0);
}