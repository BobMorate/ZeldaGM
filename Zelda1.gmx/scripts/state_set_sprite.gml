//state_set_sprite()
//Changes the sprite index based on the current state and facing direction.
if(!is_destroyed)
{
    //What is the row of the state we are in?
    var row=ds_grid_value_y(state_grid,state_script,0,state_script,ds_grid_height(state_grid)-1,state);
    
    if(!state_sprite_override)
    {
        switch(facing_direction)
        {
            case east: image_xscale=1; sprite_index=ds_grid_get(state_grid,state_sprite_east,row); break;
            case north: image_xscale=1; sprite_index=ds_grid_get(state_grid,state_sprite_north,row); break;
            case west: if(ds_grid_get(state_grid,state_sprite_east,row)==ds_grid_get(state_grid,state_sprite_west,row))
                    {
                        image_xscale=-1; 
                        sprite_index=ds_grid_get(state_grid,state_sprite_east,row); 
                    }
                    else
                    {
                        image_xscale=1; 
                        sprite_index=ds_grid_get(state_grid,state_sprite_west,row); 
                    }
                    break;
            case south: image_xscale=1; sprite_index=ds_grid_get(state_grid,state_sprite_south,row); break;
        }
    }
}