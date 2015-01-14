///instance_find_all_tag(tag <string>)
//returns a DS list of all objects with the given tag.
var list=ds_list_create();
with(obj_tagged)
{
    if(tag == argument[0])
    {
        //show_debug_message("Found Instance "+object_get_name(object_index)+":"+string(id));
        ds_list_add(list,id);
    }
}
return(list);