Documentation Author: Niko Procopi 2019

This tutorial was designed for Visual Studio 2017 / 2019
If the solution does not compile, retarget the solution
to a different version of the Windows SDK. If you do not
have any version of the Windows SDK, it can be installed
from the Visual Studio Installer Tool

Welcome to the Render Tutorial!
Prerequesites: Mirrors

This tutorial will only edit Main.cpp, we will take a screenshot
of each image by using glReadPixels, and then we will use
FFMPEG to turn all the screenshots into a 60fps video.

If we want 4 full camera rotations around the scene, that will
give us 24 seconds of video at 60fps, which is 1440 frames.
We change our "while" loop to end after 1440 frames are drawn,
rather than "while window is not closed". After 1440 frames are
drawn, we delete the shaders, and terminate GLFW, but the program
is not done, the console window is still open.

We can then use the console window to printf, while the screenshots
are being turned into the video. If real-time runs at 10fps, then 
it will take 144 seconds to render the 24-second video. While the
video renders, nothing stops the user from resizing the window, but
try not to, so that the resolution is consistent throughout the video

Keep in mind, the scene can go right back to real-time 1080p 60fps
if you temporarily set reflections to zero, or one, or if shadows
are disabled, or if number of lights are decreased. If you really
want, you can change the fragment shader to be just like Tutorial 1,
and just output the color of each polygon. That makes it easy to 
prototype a video before doing a long render

Each screenshot is made with glReadPixels and FreeImage_Save.
The frames are turned into an image with ffmpeg.exe. Our C++ 
program uses ffmpeg at the bottom of main.cpp (see line 371).

The size of the window is 1920x1080 by default, because the window
size needs to be constant for every frame rendered. To render a video,
press F5, and then wait. Eventually, the OpenGL window will close
automatically, after all the frames are rendered. Then, the 
console window will put all the frames into a video. Then, the 
console window will automatically close when the video is done.
This will be exported to a file called "test.avi".

For me, it took 30 minutes to render 24 seconds of video. To speed this
up, resolution can be decreased, number of frames can be decreased,
frame rate can be decreased (change 'ffmpeg -r 60' to 'ffmpeg -r 30' in main.cpp),
the quality can be decreased (number of ray bounces, shadows, etc).

