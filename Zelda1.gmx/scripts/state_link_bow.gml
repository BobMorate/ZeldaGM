///Link's bow state
if(state_new)
{
    shield_visible=false;
    shield_active=false;
    image_speed=.15;
}

if(state_timer>20)
{
    //create arrow
    var _a = instance_create(x,y-3,obj_arrow);
    _a.sprite_angle=facing_direction;
    _a.image_angle=facing_direction;
    _a.direction=facing_direction;
    _a.team=team;
    _a.speed=3;
    _a.damage=2;
    state_switch("Stand");
}