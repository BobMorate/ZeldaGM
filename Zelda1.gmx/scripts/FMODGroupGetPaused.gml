//export double FMODGroupGetPaused(double group)
//This gets the group paused (0, 1 (paused)) groups: 0-Master (Global), 1-priority, 2-effects, 3-ambientmusic, 4-ambient effects
return external_call(global.dll_FMODGroupGetPaused,argument0);