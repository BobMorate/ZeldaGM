///transition_add_spotlight_out(transition id, target tag);
//adds a spotlight out effect to the given transtion centered on the given target tag.
//if tag is "", or the target object cannot be found, the effect will be centered.
with(argument[0])
{
    out_effect=obj_transfx_spotlight_out;
    out_target_tag=argument[1];
}