///draw_text_stroked(x,y,string,text color,stroke color, stroke thickness, stroke accuracy)
///Default stroke accuracy is 1.  Increase it for larger strokes.
var _x=argument[0];
var _y=argument[1];
var _txt=argument[2];
var _col1=argument[3];
var _col2=argument[4];
var _thick=argument[5];
var _acc=argument[6];
if(_col2>=0)
{   //Draw Stroke
    draw_set_color(_col2);
    for(var i=0; i<(8*_acc); i++)
    {
        draw_text(_x+lengthdir_x(_thick,i*(45/_acc)),_y+lengthdir_y(_thick,i*(45/_acc)),_txt);
    }
}
draw_set_color(_col1);
draw_text(_x,_y,_txt);