///csv_to_ds_grid(file,delimiter)
//returns a ds_grid of the CSV.
//Sets global variabls with the name of column headers and stores the column reference in it.

var f,rt,rtp,cc,rc,c,cr,i,ii,g,sc;
f = file_text_open_read(argument[0]);
show_debug_message("File: "+string(argument[0]));

g=ds_grid_create(0,1)//,"Storage for CSV:"+string(argument[0]),false);

//Count Columns
rt=file_text_read_string(f);
rtp=string_parse(rt,argument[1],true);
ds_grid_resize(g,ds_list_size(rtp),ds_grid_height(g));
file_text_close(f);
f=file_text_open_read(argument[0]);

//Rows
cr=0;
var first_row=true;
while(!file_text_eof(f))
{
    if(first_row)
        first_row=false;
    else
        cr=ds_grid_add_row(g);
        
    rt=file_text_read_string(f);
    rtp=string_parse(rt,argument[1],true);
    file_text_readln(f);
    
    i=0;
    repeat(ds_list_size(rtp))
    {
        //show_debug_message(string(i)+","+string(cr)+"= "+string(ds_list_find_value(rtp,i)));
        ds_grid_set(g,i,cr, string(ds_list_find_value(rtp,i)));
        i+=1;
    }
    ds_list_destroy(rtp);
}
file_text_close(f);

return(g);