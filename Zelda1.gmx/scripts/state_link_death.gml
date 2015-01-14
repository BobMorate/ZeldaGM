///Link's death state.
if(state_new)
{
    image_speed=0;
    obj_link.x=temp_x;
    obj_link.y=temp_y;
    state_sprite_override=false;
    sprite_index=spr_link_death;
    shield_visible=false;
    timeline_index=tml_link_death;
    timeline_position=0;
    timeline_running=true;
    timeline_speed=.20;
    
    sfx_play("Link Death");
    state_interruptable=false;
    temp_invincibility_timer=0;
    is_invincible=true;
}
/*image_speed=0;
is_invincible=true;
override_controls=true;
ignore_room_boundries=false;
ignore_view_transitions=false;
ignore_collision=false;*/