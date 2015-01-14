///FMODInstanceFadeVolume(instance, current volume, targetvolume,numframes, updatecode *optional)
//instance is the instance to fade
//target volume the volume to go to
//numframes. The number of frames the effect will take place
//    use room_speed*2 for 2 seconds
//Current volume is the instance's current volume to prevent
//burst of sounds. If you dont know it try 1 if fading from an unknown volume to 0
//or 0 if going to a volume. Usually, when you use this sort of control, you know
//the volume of the instance An instance volume is 1 when it starts
//updatecode (optional) is the code to call to update your volume variable
// it has the form of "with(100010 /*YourInstanceID*/) {YourVariableName = other.instvol;}"}
// or "global.thevariablename = instvol;"
var d;
d = argument[2]
var i;
//if(argument0 > 0)
{
    d = max(0,min(d,1));
    i = (d-argument[1])/(argument[3]+1);
    with(FMODFaderObj)
    {
        if(group = argument[0] and isinst = true)
        {
            inc = max(abs(inc),abs(i))*sign(i);
            dest = d;
            exit
        }
    }
    with(instance_create(0,0,FMODFaderObj))
    {
        inc = i;
        dest = d;
        instvol = argument[1]
        group = argument[0];
        code = ""
        if(argument_count>4)
        {
            if(is_string(argument[4])) code = string(argument[4])
        }
        isinst = true;
        exit;
    }
}