///Link's Swim state.
if(state_new)
{
    z=0;
    image_speed=.1;
    shield_active=true;
    shield_visible=false;
    
    swim_accel=.05;
    swim_max=1.5;
    swim_friction=.01;
    
    movement_code=swimming_movement_and_collision;
    state_limit=30;
    sfx_play("Swim Splash",false);
}
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


if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);    

if(state_timer>state_limit)
{
    state_switch("Swim");
}