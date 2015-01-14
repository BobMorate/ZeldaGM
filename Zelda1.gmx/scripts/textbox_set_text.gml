///textbox_set_text(textbox,text)
with(argument[0])
{
    ds_list_destroy(text_list);
    text_list=string_parse(argument[1],"/",false);
}