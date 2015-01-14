///Link's attack state.
if(state_new)
{
    shield_active=false;
    shield_xoff=0;
    image_speed=0;
    //image_index=0;
    x=round(x);
    y=round(y);
    
    

    timeline_index=tml_link_boomerang;
    timeline_position=0;
    timeline_running=true;
    timeline_speed=1;
   
    
}

//Position Shield
shield_direction=facing_direction
switch(facing_direction)
{
    case north: if(image_index==1)
                {
                    shield_yoff=4;
                    shield_direction=east;     
                }
                break;
                
    case south: if(image_index==1)
                {
                    shield_direction=west;
                    shield_xoff=-2;
                    shield_yoff=4; 
                }
                break;
    case east:
    case west:  if(image_index==1)  
                    shield_visible=false;
                break;
}
