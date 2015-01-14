///item_grid_cooldown_tic()
//Updates the cooldown
if(ds_grid_get_max(item_grid,item_current_cooldown,0,item_current_cooldown,ds_grid_height(item_grid)-1)>0)
{   //There is at least one item that needs it's cooldown ticked.
    for(var i = 0;i<ds_grid_height(item_grid)-1;i++)
    {
        if(item_grid[#item_current_cooldown,i]>0)
        {
            
            item_grid[#item_current_cooldown,i]-=1;
            /*show_debug_message(string(item_grid[#item_key,i])+
                               " Cooldown: "+
                               string(item_grid[#item_current_cooldown,i])+
                               "/"+
                               string(item_grid[#item_cooldown,i]));*/
        }
    }

}