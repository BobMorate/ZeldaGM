///Link just talked to an NPC
if(state_new)
{
    ///Freeze Everyone but Link
    z=0;
    with(obj_actor_master)
        is_frozen=true;
    obj_link.is_frozen=false;
    state_interruptable=false;
    if(shield_direction=south)
        shield_visible=-1;
    else
        shield_visible=1;
    my_textbox=instance_create(0,0,obj_ui_textbox);
    textbox_set_text(my_textbox,npc.flavor_text);
}
    
if(!instance_exists(my_textbox))
{   //Wrap this up.
    my_textbox=noone;
    with(npc)
        event_user(0);//NPC have anything else to do?
    state_switch("Stand");
    with(obj_actor_master)
        is_frozen=false;
}
else
{
    if(actor_any_face_button_pressed())
    {
        my_textbox.proceed=true;
    }
}