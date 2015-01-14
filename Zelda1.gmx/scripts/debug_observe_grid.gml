///debug_observe_grid(ds_grid,keep updated?,font to display with)
with(instance_create(10,10,obj_grid_viewer))
{
    ds_grid_copy(grid,argument[0]);
    update=argument[1];
    font=argument[2];
    source_grid=argument[0];
    return(id);
}