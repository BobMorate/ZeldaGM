///sector_enable_enemies(sector label)
//recreates all enemies in the given sector
var _row = sector_is_saved(argument[0])
if(_row > -1)
{
    var _grid = ds_grid_get(recent_sector_grid,1,_row);
    for(var i=0; i<ds_grid_height(_grid);i++)
    {
        var _enm = instance_create(ds_grid_get(_grid,enemy_grid_x,i),ds_grid_get(_grid,enemy_grid_y,i),ds_grid_get(_grid,enemy_grid_type,i));
        _enm.facing_direction=ds_grid_get(_grid,enemy_grid_direction,i);
        actor_snap_to_grid(_enm);
    }
}
else
    show_debug_message("Trying to enable enemies in a sector that is not saved...");