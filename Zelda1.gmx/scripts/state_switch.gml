///state_switch(state name <string>,*optional* Execute Immediately?)
if(state_exists(argument[0]))
    state=state_get_script(argument[0]);
if(!is_swimming)
{
    x_speed=0;
    y_speed=0;
}
//Weapon
my_weapon=instance_kill(my_weapon);
if(instance_exists(my_boomerang) && my_boomerang.speed==0)
    my_boomerang=instance_kill(my_boomerang);

//State Stuff
state_timer=0;
state_sprite_override = false;
state_speed_override=false;
state_interruptable = true;
state_direction=-1;

//Physics and Image Stuff
friction = 0;
speed = 0;
image_blend = c_white;
image_speed=0;
image_index=0;

//Timeline Stuff
timeline_index = noone;
timeline_position = 0;
timeline_running = false;
timeline_speed=1;

//Execute next state immediately?
if(argument_count>1)
{
    if(argument[1])
    {
        state_new=true;
        script_execute(state_get_script(argument[0]))
    }
}