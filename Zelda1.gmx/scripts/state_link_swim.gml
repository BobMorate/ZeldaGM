///Link's Swim state.
if(state_new)
{
    z=0;
    image_speed=.1;
    shield_active=true;
    shield_visible=false;
    
    swim_accel=.03;
    swim_friction=.01;
    
    movement_code=swimming_movement_and_collision;
    
}

if(swim_max>1)
    swim_max-=swim_friction;

state_speed_override=true;


//Apply controls
x_speed+=button_left*-swim_accel;
x_speed+=button_right*swim_accel;
y_speed+=button_up*-swim_accel;
y_speed+=button_down*swim_accel;

//Set facing_direction
if(button_right)
    facing_direction=east;
else if(button_left)
    facing_direction=west;
else if(button_up)
    facing_direction=north;
else if(button_down)
    facing_direction=south;


var _wall=instance_place(x+lengthdir_x(3,facing_direction),y+lengthdir_y(3,facing_direction),obj_wall);
if(_wall.object_index==obj_wall_water_jump)
{   //Jump out of water
    if((against_wall > 10 || button_context_pressed) && !place_meeting(x+lengthdir_x(32,facing_direction),y+lengthdir_y(32,facing_direction),obj_wall))
    {   //Jump
        state_switch("Jump");
    }
}
else if(x_speed == 0 && y_speed=0)
    state_switch("Tread Water");
else if(button_context_pressed)
    state_switch("Stroke");

if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);    