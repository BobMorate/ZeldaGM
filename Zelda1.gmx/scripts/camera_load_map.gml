///camera_load_map()
//Loads the camera map based on the current room.
//show_debug_message("Loading map for room: "+room_get_name(room));
camera_grid=ds_map_find_value(room_map,room);