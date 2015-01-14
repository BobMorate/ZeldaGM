///actor_is_invincible(Actor Instance ID)
//returns true if actor is invincible
if(argument_count>0)
{
    with(argument[0])
        return(is_invincible || is_temp_invincible || temp_invincibility_timer>0);
}
else
    return(is_invincible || is_temp_invincible || temp_invincibility_timer>0);