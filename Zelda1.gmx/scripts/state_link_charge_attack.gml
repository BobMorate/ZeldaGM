if(state_new)
{
    shield_active=false;
    shield_visible=false;
    state_interruptable=false;
    x=round(x);
    y=round(y);
    image_speed=0;
    
    timeline_index=tml_link_charge_attack;
    timeline_position=0;
    timeline_running=true;
    timeline_speed=1;
    sfx_play("Sword Spin");
}