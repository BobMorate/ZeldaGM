///environment_draw_lights()
draw_set_blend_mode(bm_add);
if(lantern_base>0)
{
    var _x=obj_link.x-view_xview;
    var _y=obj_link.y-view_yview;
    
    lantern_scale+=lantern_speed;
    var _scale=oscillate(lantern_base,lantern_amp,lantern_scale);
    draw_sprite_ext(spr_lamp_glow,0,_x,_y,_scale,_scale,obj_link.facing_direction,c_white,light_alpha);
}      
with(obj_fx_flame_big)
{
    draw_set_alpha(other.light_alpha);
    draw_circle_colour(x-view_xview,y-view_yview,irandom_range(8,12),c_white,c_orange,false);
    draw_sprite(sprite_index,image_index,x-view_xview,y-view_yview)
    draw_set_alpha(1);
}
with(obj_fx_light)
    draw_sprite_ext(sprite_index,image_index,x-view_xview,y-view_yview,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
with(obj_actor_master)
{
    if(light_sprite != -1)
    {
        draw_sprite_ext(light_sprite,image_index,x-view_xview,y-view_yview-z,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
    }
}
    
draw_set_blend_mode(bm_normal);