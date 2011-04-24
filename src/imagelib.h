#ifndef ERIF_IMAGELIB
#define ERIF_IMAGELIB

#include "os.h" // WINDOWS or LINUX or OSX

#define BITMAP_ID 0x4D42

typedef struct _RGBIMG {
  GLuint w, h;
  //GLubyte w, h;
  unsigned char* data;
} RGBIMG;

GLuint LoadTextureRAW(const char * filename, int width, int height, int wrap, int alpha); // loads an RGB/RGBA .RAW file as a texture

#endif
