if(state_new)
{
    image_index=0;
    x=obj_link.x;
    y=obj_link.y;
    visible=true;
    z=screen_width;
    is_invincible=true;
    sfx_play("Jump",false);
    override_depth=true;
    depth=-20000;   
}

var _fall_time=room_speed*1.5;
var _retreat_time=room_speed*4;
var _close_time=room_speed*2

z=clamp(lerp(screen_width,0,state_timer/_fall_time),0,screen_width);

if(state_timer==_close_time)
    image_index=1;

if(state_timer>_retreat_time)
    state_switch("Retreat");

//Check for link.
if(z==0)
{
    depth=-y;
    is_invincible=false;
    var _caught=false;
    with(obj_link)
    {
        if(instance_position(x,y,obj_wall_master)==other.id && !actor_is_invincible(id) && state_interruptable)
        {
            //show_message("Caught");
            _caught=true;
            my_hand=other.id;
            state_switch("Captured");
        }
    }
    if(_caught)
    {
        image_index=1;
        state_switch("Retreat");
        sfx_play("Grab",false);
    }
}