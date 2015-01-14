///room_transition_general(room,init delay,out style,out length,out tag,wait,in style,in length,in tag)
//Creates a transition control that will fade out, move rooms, fade in, then destroy.
//---
var i=instance_create(0,0,obj_room_transition_manager);
with(i)
{
    //Room
    target_room=argument[0];
    
    //Out
    out_delay=(argument[1]*room_speed)+1;
    transition_effect_out=argument[2];
    out_length=argument[3];
    out_target_tag=argument[4];
    
    //In
    in_delay=argument[5]*room_speed+1;
    transition_effect_in=argument[6];
    in_length=argument[7];
    in_target_tag=argument[8];   
}
    
return(i);