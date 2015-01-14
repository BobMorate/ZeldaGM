///instance_activate_region_object(x1,y1,x2,y2,obj_type)
//activates the given object type within a region. Disables all others.
//This may be horribly inefficient.

instance_activate_object(argument[4]);
if(instance_exists(argument[4]))
{
    //show_debug_message("Total "+object_get_name(argument[4])+" Objects: "+string(instance_number(argument[4])));
    var _count=0;
    with(argument[4])
    {
        if(x<argument[0] || x>argument[2] ||
           y<argument[1] || y>argument[3])
        {
           instance_deactivate_object(id);
           _count+=1;
        }
        
    }
    //show_debug_message("Disabled "+string(_count)+" "+object_get_name(argument[4])+" object(s)");
}
    