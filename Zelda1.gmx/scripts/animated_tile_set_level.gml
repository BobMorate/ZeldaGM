//animated_tile_set_level(level)
//Changes the current priority threshold of the animated tile system.  
//Useful for allowing the player to reduce the number of animated tiles to improve performance.
//But what does that really mean?  When you add a tileset, you set it's prioirty.  This should be
//any number over 0.  So if I have a tileset that is prioirty 1, and another at prioirty 5, if I set
//the level to 3, then the prioirty 5 will stop animating.  Setting the level to 5, will ensure all tiles animate
//as long as you don't set any with a prioirty greater than 5.  Setting the level to 0, will turn off all animations
//for maximum performance.  So in practice, give the most important animated tiles, the lowest prioirties, 
//and the least important the highest.
Animated_Tile_Level=argument[0];