/** mac compile: gcc -framework OpenAL -framework OpenGL -framework GLUT -framework Foundation -o FallingUp fallingup.c */
#ifndef ERIF_OS
#define ERIF_OS

#include <stdlib.h>

#ifdef OSX
#define AUDIO
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <GLUT/glut.h>
#include <OpenAL/al.h>
#include <OpenAL/alut.h>
#include <OpenAL/alc.h>
#include <pwd.h> // also for LINUX?
#include <unistd.h>
#endif

/** windows compile: gcc -mwindows -o FallingUp.exe fallingup.c -lglut32 -lopengl32 -lglu32 -lalut -lopenal32 */
#ifdef WINDOWS
#define AUDIO
#include <windows.h>
// OpenGL includes
#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/glut.h>
#include <al.h>
#include <alc.h>
//#include <alctypes.h>
//#include <altypes.h>
#include <alu.h>
#include <alut.h>
#endif

#ifdef LINUX
// OpenGL includes
#include <GL/gl.h>
#include <GL/glu.h>
#include <GL/glut.h>
// OpenAL includes

#ifdef AUDIO
#include <AL/al.h>
#include <AL/alc.h>
#include <AL/alut.h>
#endif

#endif // LINUX

#endif //ERIF_OS
