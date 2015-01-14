//
// Simple passthrough vertex shader
// Don't need to do ANYTHING in here.  Go to the fragment shader.
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Okay, So obviously we have a whole bunch of variables for the different colors.
// Right now this only supports 16 colors, which is enough for most SNES style, 16-bit
// Sprites.  If you want to support sprites with more colors, just look below for the
// Instructions in the comments.

uniform vec3 f_Colour0;
uniform vec3 f_Colour1;
uniform vec3 f_Colour2;
uniform vec3 f_Colour3;
uniform vec3 f_Colour4;
uniform vec3 f_Colour5;
uniform vec3 f_Colour6;
uniform vec3 f_Colour7;
uniform vec3 f_Colour8;
uniform vec3 f_Colour9;
uniform vec3 f_Colour10;
uniform vec3 f_Colour11;
uniform vec3 f_Colour12;
uniform vec3 f_Colour13;
uniform vec3 f_Colour14;
uniform vec3 f_Colour15;
uniform vec3 f_Colour16;
uniform vec3 f_Colour17;
uniform vec3 f_Colour18;
//uniform vec3 f_Colour16...17...etc 

uniform vec3 s_Colour0;
uniform vec3 s_Colour1;
uniform vec3 s_Colour2;
uniform vec3 s_Colour3;
uniform vec3 s_Colour4;
uniform vec3 s_Colour5;
uniform vec3 s_Colour6;
uniform vec3 s_Colour7;
uniform vec3 s_Colour8;
uniform vec3 s_Colour9;
uniform vec3 s_Colour10;
uniform vec3 s_Colour11;
uniform vec3 s_Colour12;
uniform vec3 s_Colour13;
uniform vec3 s_Colour14;
uniform vec3 s_Colour15;
uniform vec3 s_Colour16;
uniform vec3 s_Colour17;
uniform vec3 s_Colour18;
//uniform vec3 s_Colour16...17...etc 

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //It's silly how GLSL doesn't support switch statements...  So huge if/else chain it is!
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    if( col.rgb == f_Colour0.rgb )
    {
        col.rgb = s_Colour0.rgb;
    }
    else if( col.rgb == f_Colour1.rgb )
    {
        col.rgb = s_Colour1.rgb;
    }
    else if( col.rgb == f_Colour2.rgb )
    {
        col.rgb = s_Colour2.rgb;
    }
    else if( col.rgb == f_Colour3.rgb )
    {
        col.rgb = s_Colour3.rgb;
    }
    else if( col.rgb == f_Colour4.rgb )
    {
        col.rgb = s_Colour4.rgb;
    }
    else if( col.rgb == f_Colour5.rgb )
    {
        col.rgb = s_Colour5.rgb;
    }
    else if( col.rgb == f_Colour6.rgb )
    {
        col.rgb = s_Colour6.rgb;
    }
    else if( col.rgb == f_Colour7.rgb )
    {
        col.rgb = s_Colour7.rgb;
    }
    else if( col.rgb == f_Colour8.rgb )
    {
        col.rgb = s_Colour8.rgb;
    }
    else if( col.rgb == f_Colour9.rgb )
    {
        col.rgb = s_Colour9.rgb;
    }
    else if( col.rgb == f_Colour10.rgb )
    {
        col.rgb = s_Colour10.rgb;
    }
    else if( col.rgb == f_Colour11.rgb )
    {
        col.rgb = s_Colour11.rgb;
    }
    else if( col.rgb == f_Colour12.rgb )
    {
        col.rgb = s_Colour12.rgb;
    }
    else if( col.rgb == f_Colour13.rgb )
    {
        col.rgb = s_Colour13.rgb;
    }
    else if( col.rgb == f_Colour14.rgb )
    {
        col.rgb = s_Colour14.rgb;
    }
    else if( col.rgb == f_Colour15.rgb )
    {
        col.rgb = s_Colour15.rgb;
    }
    else if( col.rgb == f_Colour16.rgb )
    {
        col.rgb = s_Colour16.rgb;
    }
    else if( col.rgb == f_Colour17.rgb )
    {
        col.rgb = s_Colour17.rgb;
    }
    else if( col.rgb == f_Colour18.rgb )
    {
        col.rgb = s_Colour18.rgb;
    }
    //Duplicate this block as many times as necessary below, just change the number.
    //else if( col.rgb == f_Colour16.rgb )
    //{
    //    col.rgb = s_Colour16.rgb;
    //}
    
    gl_FragColor = v_vColour * col;
    
}

