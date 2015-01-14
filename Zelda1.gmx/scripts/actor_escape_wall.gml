//Break out of collision
if(place_meeting(x,y,obj_wall) && !ignore_collision)
{   ///Break out of walls
    show_debug_message("Caught in a wall, breaking out");
    var xx=x;
    var yy=y;
    var safe=false;
    for(var i=.1; i<5; i+=.1)
    {
        for(var ii=0; ii<8;ii++)    
        {
            if(!place_meeting(xx+round(lengthdir_x(i,ii*45)),yy+round(lengthdir_y(i,ii*45)),obj_wall))
            {
                xx+=round(lengthdir_x(i,ii*45));
                yy+=round(lengthdir_y(i,ii*45));
                safe=true;
                break;
            }
        }
        if(safe)
        {
            x=xx;
            y=yy;
            break;
        }
    }
}