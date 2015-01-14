///model_right_triangle_create(model index, scale)
var model=argument[0]
d3d_model_primitive_begin(model,pr_trianglelist);
var _scale=argument[1];;
var _width=.5;
//Front Tri
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, _width*_scale,0,0,1,c_white,1); //front-top
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, _width*_scale,0,0,1,c_white,1); //front-left
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, _width*_scale,0,0,1,c_white,1); //front-right
//Back tri
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, -_width*_scale,0,0,-1,c_white,1); //back-top
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, -_width*_scale,0,0,-1,c_white,1); //back-left
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, -_width*_scale,0,0,-1,c_white,1); //back-right
//Top Left Side
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, _width*_scale,-.5,.5,0,c_white,1); //front-top
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, -_width*_scale,-.5,.5,0,c_white,1); //back-top
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, -_width*_scale,-.5,.5,0,c_white,1); //back-left
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, _width*_scale,-.5,.5,0,c_white,1); //front-top
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, -_width*_scale,-.5,.5,0,c_white,1); //back-left
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, _width*_scale,-.5,.5,0,c_white,1); //front-left
//Top Right Side
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, _width*_scale,.5,.5,0,c_white,1); //front-top
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, -_width*_scale,.5,.5,0,c_white,1); //back-top
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, _width*_scale,.5,.5,0,c_white,1); //front-right
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, _width*_scale,.5,.5,0,c_white,1); //front-right
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, -_width*_scale,.5,.5,0,c_white,1); //back-right
d3d_model_vertex_normal_color(model, 0*_scale, 1*_scale, -_width*_scale,.5,.5,0,c_white,1); //back-top
//Bottom
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, _width*_scale,0,-.5,0,c_white,1); //front-left
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, _width*_scale,0,-.5,0,c_white,1); //front-right
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, -_width*_scale,0,-.5,0,c_white,1); //back-left
d3d_model_vertex_normal_color(model, -2*_scale, -1*_scale, -_width*_scale,0,-.5,0,c_white,1); //back-left
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, -_width*_scale,0,-.5,0,c_white,1); //back-right
d3d_model_vertex_normal_color(model, 2*_scale, -1*_scale, _width*_scale,0,-.5,0,c_white,1); //front-right
d3d_model_primitive_end(model);