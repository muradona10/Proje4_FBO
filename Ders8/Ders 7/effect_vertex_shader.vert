#version 120

attribute vec2 v_coord;
attribute vec3 color;
uniform sampler2D fbo_texture;
varying vec2 f_texcoord;
varying float3 OutColor;
 
void main(void) {
    gl_Position = vec4(v_coord, 0.0, 1.0);
    f_texcoord = (v_coord + 1.0) / 2.0;

	float3 Incolor = tex2d(fbo_texture,f_texcoord).xyz;
	
	OutColor.r = tex1D(ColorCorrMap, InColor.r).r;
	OutColor.g = tex1D(ColorCorrMap, InColor.g).g;
	OutColor.b = tex1D(ColorCorrMap, InColor.b).b; 
}

