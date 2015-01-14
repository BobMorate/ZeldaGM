///angle_normalize(angle)
//will return a number between 0-359.99999
if(argument[0]>=360)
    return(argument[0]-360);
else if(argument[0]<0)
    return(argument[0]+360);
else
    return(argument[0]);