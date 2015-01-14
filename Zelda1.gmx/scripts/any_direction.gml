//Has any direction been pressed?
if(button_left || button_right || button_down || button_up)
{
    if(button_left && button_right)
        return(false);
    if(button_up && button_down)
        return(false);
    return(true);
}
else
    return(false);