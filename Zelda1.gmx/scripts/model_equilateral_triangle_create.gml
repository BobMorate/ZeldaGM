///model_right_triangle_create(model index, scale, color)
var model=argument[0]
d3d_model_primitive_begin(model,pr_trianglelist);
var _scale=argument[1];
var _width=.3;
var ax,ay,bx,by,cx,cy,r;
r=1;
cx=0;
cy=r;
bx = cx * cos(degtorad(120)) - (cy * sin(degtorad(120)));
by = cx * sin(degtorad(120)) + (cy * cos(degtorad(120)));
ax = cx * cos(degtorad(240)) - (cy * sin(degtorad(240)));
ay = cx * sin(degtorad(240)) + (cy * cos(degtorad(240)));


//Front Tri
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, _width*_scale,0,0,1,argument[2],1); //front-top
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, _width*_scale,0,0,1,argument[2],1); //front-left
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, _width*_scale,0,0,1,argument[2],1); //front-right
//Back tri
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, -_width*_scale,0,0,-1,argument[2],1); //back-top
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, -_width*_scale,0,0,-1,argument[2],1); //back-left
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, -_width*_scale,0,0,-1,argument[2],1); //back-right
//Top Left Side
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, _width*_scale,-.5,.5,0,argument[2],1); //front-top
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, -_width*_scale,-.5,.5,0,argument[2],1); //back-top
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, -_width*_scale,-.5,.5,0,argument[2],1); //back-left
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, _width*_scale,-.5,.5,0,argument[2],1); //front-top
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, -_width*_scale,-.5,.5,0,argument[2],1); //back-left
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, _width*_scale,-.5,.5,0,argument[2],1); //front-left
//Top Right Side
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, _width*_scale,.5,.5,0,argument[2],1); //front-top
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, -_width*_scale,.5,.5,0,argument[2],1); //back-top
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, _width*_scale,.5,.5,0,argument[2],1); //front-right
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, _width*_scale,.5,.5,0,argument[2],1); //front-right
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, -_width*_scale,.5,.5,0,argument[2],1); //back-right
d3d_model_vertex_normal_color(model, cx*_scale, cy*_scale, -_width*_scale,.5,.5,0,argument[2],1); //back-top
//Bottom
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, _width*_scale,0,-.5,0,argument[2],1); //front-left
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, _width*_scale,0,-.5,0,argument[2],1); //front-right
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, -_width*_scale,0,-.5,0,argument[2],1); //back-left
d3d_model_vertex_normal_color(model, ax*_scale, ay*_scale, -_width*_scale,0,-.5,0,argument[2],1); //back-left
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, -_width*_scale,0,-.5,0,argument[2],1); //back-right
d3d_model_vertex_normal_color(model, bx*_scale, by*_scale, _width*_scale,0,-.5,0,argument[2],1); //front-right
d3d_model_primitive_end(model);