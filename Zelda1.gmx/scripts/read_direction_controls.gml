///Read the controls to determin an x and y speed.
x_speed=0;
y_speed=0;

x_speed+=button_left*-1;
x_speed+=button_right*1;
if(button_left && button_right)
    x_speed=0;
y_speed+=button_up*-1;
y_speed+=button_down*1;

