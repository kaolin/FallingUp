#include "os.h" // WINDOWS or LINUX or OSX
#include <stdio.h>

#include "imagelib.h"

// loads an RGB or RGBA .RAW file as a texture
GLuint LoadTextureRAW( const char * filename, int width, int height, int wrap, int alpha ) {
	GLuint texture;
	GLbyte * data;
	FILE * file;
	int bits;

	if (alpha) {
		bits = 4;
	} else {
		bits = 3;
	}

	// open texture data
	file = fopen( filename, "rb" );
	if ( file == NULL ) return 0;

	// allocate buffer
	data = (GLbyte *)malloc( width * height * bits );

	// read texture data
	fread( data, width * height * bits, 1, file );
	fclose( file );

	// allocate a texture name
	glGenTextures( 1, &texture );

	// select our current texture
	glBindTexture( GL_TEXTURE_2D, texture );

	// select modulate to mix texture with color for shading
	glTexEnvf( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE );

	// when texture area is small, bilinear filter the closest mipmap
	glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,
							GL_LINEAR_MIPMAP_NEAREST );
	// when texture area is large, bilinear filter the first mipmap
	glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );

	// if wrap is true, the texture wraps over at the edges (repeat)
	//		... false, the texture ends at the edges (clamp)
	glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S,
							wrap ? GL_REPEAT : GL_CLAMP );
	glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T,
							wrap ? GL_REPEAT : GL_CLAMP );

	// build our texture mipmaps
	if (alpha) {
		gluBuild2DMipmaps( GL_TEXTURE_2D, 4, width, height,
				 GL_RGBA, GL_UNSIGNED_BYTE, data );
	} else {
		gluBuild2DMipmaps( GL_TEXTURE_2D, 3, width, height,
				 GL_RGB, GL_UNSIGNED_BYTE, data );
	}

	// free buffer
	free( data );

	return texture;
}
