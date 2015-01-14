///draw_frame(x1,y1,x2,y2,frame sprite);
var _spr=argument[4];
var _x1=argument[0];
var _y1=argument[1];
var _x2=argument[2];
var _y2=argument[3];

var _w=_x2-_x1;
var _h=_y2-_y1;
var _sw=sprite_get_width(_spr);
var _sh=sprite_get_height(_spr);
//Top & Bottom Edge
for(var i=1;i<_w/_sw;i++)
{
    draw_sprite(_spr,1,_x1+_sw*i,_y1);
    draw_sprite(_spr,7,_x1+_sw*i,_y2);
}

//Left & right Edge
for(var i=1;i<_h/_sh;i++)
{
    draw_sprite(_spr,3,_x1,_y1+_sh*i);
    draw_sprite(_spr,5,_x2,_y1+_sh*i);
}
///draw corners
draw_sprite(_spr,0,_x1,_y1);
draw_sprite(_spr,2,_x2,_y1);
draw_sprite(_spr,6,_x1,_y2);
draw_sprite(_spr,8,_x2,_y2);
