///instance_find_tag(tag <string>)
with(obj_tagged)
{
    //show_debug_message("Object Name: "+string(object_get_name(object_index)));
    if(tag == argument[0])
    {
        //show_debug_message("Found Instance "+object_get_name(object_index)+":"+string(id));
        return(id);
    }
}
show_debug_message("Unable to find instance with tag"+string(argument[0]));
return(noone);