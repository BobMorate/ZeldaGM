///coordinate_pair_get_x(coordinate pair)
//Gets the X value for the given coordinate pair (a string formatted as "X,Y")
var _s=argument[0];
var _comma=string_pos(",",_s);
var _r="";
_r=string_copy(_s,1,_comma-1);
return(real(_r));