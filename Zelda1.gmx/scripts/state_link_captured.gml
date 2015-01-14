///Link's been captured by a wall master
if(state_new)
{
    x=my_hand.x;
    y=my_hand.y-1;
    is_invincible=true;
    shield_visible=false;
    shield_active=false
    override_depth=true;
    depth=my_hand.depth+1; 
}

z=my_hand.z;