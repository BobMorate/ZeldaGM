///room_transition_change_music(transition ID, use room song?, new song key <string - optional>,new song position <ms - optional>);
//Adds a music transition to the given transition
with(argument[0])
{
    music_change=true;
    use_room_song=argument[1];
    if(argument_count>2)
    {
        new_song=argument[2];
        if(argument_count>3)
        {
            new_song_position=argument[3];
        }
    }
    else
        new_song="";
}