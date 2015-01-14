///transition_add_spotlight_in(transition id, target tag);
//adds a spotlight in effect to the given transtion centered on the given target tag.
//if tag is "", or the target object cannot be found, the effect will be centered.
with(argument[0])
{
    in_effect=obj_transfx_spotlight_in;
    in_target_tag=argument[1];
}