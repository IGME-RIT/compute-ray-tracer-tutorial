Documentation Author: Niko Procopi 2019

This tutorial was designed for Visual Studio 2017 / 2019
If the solution does not compile, retarget the solution
to a different version of the Windows SDK. If you do not
have any version of the Windows SDK, it can be installed
from the Visual Studio Installer Tool

Welcome to the Compute Tutorial!
Prerequesites: Compute Shaders (more graphics), AVI Movie

There are two shader programs in this tutorial. The compute program
generates an image with ray tracing, and the quad program draws
the image to the screen. You can disable drawing to the screen by
setting useWindow boolean to false near the top of main.cpp

The advantage of drawing without a window allows programs to 
run on supercomputers, where not every node of a computer cluster
is connected to a screen.

Ray Program
The Compute Shader is almost identical to the fragment shader in 
the last tutorial, except for the top of the file, where we define the 
output image, 
	layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
	layout(rgba8, binding = 0) uniform image2D img_output;

and void main(), where we determine the direction of the vector by 
dividing gl_GlobalInvocation by the desired resolution. If someone
wants to change the resolution, they have to change the values in
this shader. This can also become dynamic with uniform buffers
	vec2 pos = vec2(
		gl_GlobalInvocationID.x / 1280.0f,
		gl_GlobalInvocationID.y / 720.0f
	);

Quad program
The Vertex Shader is the same as before
The Fragment Shader takes in a texture, which was outputted
by the compute shader, and then draws it on the screen.

Init()
We make a new empty texture that is the size of the desired
resolution that we will use for ray tracing. This render resolution
does not depend on the size of the window (unlike other tutorials)

RenderScene()
We use glUseProgram to activate the compute program, we 
use calcCameraRays to send the uniforms to the compute shader,
we bind the texture that we made in Init(), so that the compute 
shader can export pixels to it. Then, we use glMemoryBarrier
to allow the GPU to wait until the Compute Shader is finished,
before we proceed further in the program. After the image is done
rendering, we activate the Quad Program, send the texture to the
fragment shader, and draw the quad, which puts the rendered image
on the screen. After that, rather than using glReadPixels, we use
the new function glGetTexImage to get pixels from the texture that
we rendered to, and then we save pixels to a PNG file, just like before