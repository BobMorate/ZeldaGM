///Link's walking state.
if(state_new)
{
    z=0;
    image_speed=.3;
    shield_active=true;
    movement_code=standard_movement_and_collision;
}
//Break out of collision
if(place_meeting(x,y,obj_wall) && !ignore_collision)
{   ///Break out of walls
    var _inst = instance_place(x,y,obj_wall);
    if(_inst.enabled)
    {
        show_debug_message("Caught in a wall, breaking out");
        var xx=x;
        var yy=y;
        var safe=false;
        for(var i=.1; i<5; i+=.1)
        {
            for(var ii=0; ii<4;ii++)    
            {
                if(!place_meeting(xx+round(lengthdir_x(i,ii*90)),yy+round(lengthdir_y(i,ii*90)),obj_wall))
                {
                    xx+=round(lengthdir_x(i,ii*90));
                    yy+=round(lengthdir_y(i,ii*90));
                    safe=true;
                    break;
                }
            }
            if(safe)
            {
                x=xx;
                y=yy;
                break;
            }
        }
    }
}
if(any_direction())
{
    //Bounce shield
    if(facing_direction == east || facing_direction == west)
        shield_yoff = -floor(image_index) mod 2;
    else
        shield_yoff = -(floor(image_index) mod 4) mod 3;
    
    ///Splash Sound
    if(in_shallow_water && state_timer mod 15 == 0)
        sfx_play("Walk Splash");
        
    ///Tall Grass
    if(in_tall_grass)
    {
        grass_frame+=grass_speed;
        if(state_timer mod 15 == 0)
            sfx_play("Grass Walk");
    }
    else
        grass_frame=0;
                
    read_direction_controls();
    //Set facing_direction
    if(x_speed>0 && y_speed==0)
        facing_direction=east;
    else if(x_speed<0 && y_speed==0)
        facing_direction=west;
    else if(x_speed==0 && y_speed<0)
        facing_direction=north;
    else if(x_speed==0 && y_speed>0)
        facing_direction=south;
    else if(x_speed<0)
        facing_direction=west;
    else if(x_speed>0)
        facing_direction=east
    else if(y_speed>0)
        facing_direction=south;
    else if(y_speed<0)
        facing_direction=north;
    
    if(state_new)
    {   //Silly people pressing two directions at once... 
        if(x_speed != 0 && y_speed>0)
        facing_direction=south;
        else if(x_speed != 0 && y_speed<0)
            facing_direction=north;
    }
    
    shield_direction=facing_direction;
    if(shield_direction=south)
        shield_visible=-1;
    else
        shield_visible=1;
    
    //Push against walls
    if(against_wall > 0)
    {
        //Push Blocks
        if(against_wall > room_speed*.5 && !instance_exists(obj_room_transition_manager))
            state_switch("Push");
        //Context Button Stuff
        else if(button_context_pressed)
        {
            //Open Chests    
            if(facing_direction==north && place_meeting(x,y-2,obj_chest_small))
            {
                var _chest=instance_place(x,y-2,obj_chest_small);
                _chest.active=true;
            }
            //Talk to NPCs
            else if(place_meeting(x+lengthdir_x(2,facing_direction),y+lengthdir_y(2,facing_direction),obj_npc_master))
            {
                var _npc = instance_place(x+lengthdir_x(2,facing_direction),y+lengthdir_y(2,facing_direction),obj_npc_master);
                _npc.active=true;
            }
        }
        var _wall=instance_place(x+lengthdir_x(3,facing_direction),y+lengthdir_y(3,facing_direction),obj_wall);
        if(_wall.object_index==obj_wall_jump && save_data_get("Feather")==true)
        {   //Wall Jump Stuff
            if((against_wall > 10 || button_context_pressed) && !place_meeting(x+lengthdir_x(32,facing_direction),y+lengthdir_y(32,facing_direction),obj_wall))
            {   //Jump
                state_switch("Jump");
            }
        }
        if(_wall.object_index==obj_wall_water_jump && save_data_get("Flippers")==true)
        {   //Wall Jump Stuff
            if(!place_meeting(x+lengthdir_x(32,facing_direction),y+lengthdir_y(32,facing_direction),obj_wall))
            {   //Jump
                state_switch("Jump");
            }
        }
        //Open Locked doors
        if(against_wall>room_speed*.25 && place_meeting(x+lengthdir_x(16,facing_direction),y+lengthdir_y(16,facing_direction),obj_locked_door))
        {
            var _door=instance_place(x+lengthdir_x(16,facing_direction),y+lengthdir_y(16,facing_direction),obj_locked_door);
            _door.active=true;
        }
    }
    
    //Run
    else if(button_context_pressed && save_data_get("Boots")==1)
    {
        state_switch("Boots Windup");
    }
        
}
else
{
    state_switch("Stand");
    
}
    
if(button_attack_pressed && save_data_get("Sword")>0)
    state_switch("Attack");
if(button_item_pressed)
    item_use();

if(button_equip_previous_pressed)
    item_shift_equipped(-1);
else if(button_equip_next_pressed)
    item_shift_equipped(1);    