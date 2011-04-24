# Process this file with autoconf to produce a configure script.
# http://www.freesoftwaremagazine.com/books/agaal/configuring_a_project_with_autoconf

AC_PREREQ([2.50])
AC_INIT([fallingup], [0.0.5], [fallingup@erif.org])

AC_ARG_ENABLE([audio],
  AS_HELP_STRING([--disable-audio],[Disable sound effects]))

AM_INIT_AUTOMAKE([])

# Checks for programs.
AC_PROG_CC

# Checks for libraries.
AC_CHECK_LIB([GL], [glIsTexture], [], [ AC_MSG_ERROR(["GL library is required for this program"])])
AC_CHECK_LIB([GLU], [gluGetString], [], [ AC_MSG_ERROR(["GLU library is required for this program"])])
AC_CHECK_LIB([glut], [glutInit], [], [ AC_MSG_ERROR(["Glut library is required for this program"])])

have_alut=no
have_openal=no
have_audio=no
AC_SEARCH_LIBS(alGetError,[openal32 openal],[have_openal=yes])
AC_SEARCH_LIBS(alutInit,[ALut alut],[have_alut=yes])
#AC_CHECK_LIB([openal], [alGetError], [], [ AC_MSG_ERROR(["OpenAL library is required for audio"])])
#AC_CHECK_LIB([alut], [alutInit], [], [ AC_MSG_ERROR(["Alut library is required for audio"])])

if test "x${have_openal}" = xyes; then
	AC_CHECK_HEADERS([AL/al.h],[],[have_openal=no])
fi

if test "x${have_alut}" = xyes; then
	AC_CHECK_HEADERS([AL/alut.h],[],[have_alut=no])
fi

if test "x${have_alut}${have_openal}" = xyesyes; then
	have_audio=yes
fi

if test "x${have_audio}" == xno; then
	if test "x$enable_audio" != xno; then
		echo "--------------------------------"
			if test "x${have_openal}" = xno; then
				echo "Unable to find OpenAL"
			fi
			if test "x${have_alut}" = xno; then
				echo "Unable to find Alut"
			fi
		echo " :: Building without audio. :: "
		echo "--------------------------------"
		audio=no
	fi
fi

AS_IF([test "x$enable_audio" != "xno"], [
	enable_audio=yes
	AC_DEFINE([AUDIO],1,[audio enabled])],[
	enable_audio=no
])

#AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile
	src/Makefile
	resources/Makefile
	resources/images/Makefile
	resources/images/tiles/Makefile
	resources/sounds/Makefile])
AC_CONFIG_SRCDIR([src/fallingup.c])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([gettimeofday])

AC_OUTPUT

echo \
"-------------------------------------------------

 ${PACKAGE_NAME} Version ${PACKAGE_VERSION}

 Prefix: '${prefix}'.
 Compiler: '${CC} ${CFLAGS} ${CPPFLAGS}'

 Package features:
   Audio enabled: ${enable_audio}

 Now type 'make @<:@<target>@:>@'
   where the optional <target> is:
     all                - build all binaries
     install            - install everything

--------------------------------------------------"
