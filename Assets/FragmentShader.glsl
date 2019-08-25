/*
Title: Advanced Ray Tracer
File Name: FragmentShader.glsl
Copyright © 2019
Original authors: Niko Procopi
Written under the supervision of David I. Schwartz, Ph.D., and
supported by a professional development seed grant from the B. Thomas
Golisano College of Computing & Information Sciences
(https://www.rit.edu/gccis) at the Rochester Institute of Technology.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

References:
https://github.com/LWJGL/lwjgl3-wiki/wiki/2.6.1.-Ray-tracing-with-OpenGL-Compute-Shaders-(Part-I)

Description:
This program serves to demonstrate the concept of ray tracing. This
builds off a previous Intermediate Ray Tracer, adding in reflections. 
There are four point lights, specular and diffuse lighting, and shadows. 
It is important to note that the light positions and triangles being 
rendered are all hardcoded in the shader itself. Usually, you would 
pass those values into the Fragment Shader via a Uniform Buffer.

WARNING: Framerate may suffer depending on your hardware. This is a normal 
problem with Ray Tracing. If it runs too slowly, try removing the second 
cube from the triangles array in the Fragment Shader (and also adjusting 
NUM_TRIANGLES accordingly). There are many optimization techniques out 
there, but ultimately Ray Tracing is not typically used for Real-Time 
rendering.
*/

#version 400 
uniform sampler2D tex;
in vec2 textureCoord;
out vec4 color;

void main()
{
	color = texture(tex, textureCoord);
}

