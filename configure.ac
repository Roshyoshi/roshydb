AC_PREREQ([2.71])
AC_INIT([roshydb], [0.1.0], [roshydb@example.invalid])
AC_CONFIG_SRCDIR([include/roshydb/version.hpp])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_HEADERS([config.h])

AM_INIT_AUTOMAKE([foreign subdir-objects -Wall])
AM_SILENT_RULES([yes])

AC_PROG_CXX
AC_LANG([C++])
AM_PROG_AR
LT_INIT

PKG_PROG_PKG_CONFIG
PKG_CHECK_MODULES([GTEST], [gtest_main])

AC_ARG_ENABLE(
  [werror],
  [AS_HELP_STRING([--enable-werror], [treat compiler warnings as errors])],
  [],
  [enable_werror=no])

WARN_CXXFLAGS="-Wall -Wextra -Wpedantic"
AS_IF([test "x$enable_werror" = "xyes"], [
  WARN_CXXFLAGS="$WARN_CXXFLAGS -Werror"
])
AC_SUBST([WARN_CXXFLAGS])

AC_CACHE_CHECK([for a C++26 compiler flag], [roshydb_cv_cxx26_flag], [
  roshydb_cv_cxx26_flag=no
  roshydb_save_CXXFLAGS=$CXXFLAGS
  for flag in -std=c++26 -std=c++2c; do
    CXXFLAGS="$roshydb_save_CXXFLAGS $flag"
    AC_COMPILE_IFELSE(
      [AC_LANG_PROGRAM(
        [[#include <version>
#if !defined(__cplusplus) || __cplusplus <= 202302L
#error "compiler is not in a post-C++23 mode"
#endif
        ]],
        [[]])],
      [roshydb_cv_cxx26_flag=$flag
       break])
  done
  CXXFLAGS=$roshydb_save_CXXFLAGS
])

AS_IF([test "x$roshydb_cv_cxx26_flag" = "xno"], [
  AC_MSG_ERROR([a compiler with C++26 support is required])
])
CXXFLAGS="$CXXFLAGS $roshydb_cv_cxx26_flag"

AC_CONFIG_FILES([
  Makefile
  src/Makefile
  tests/Makefile
])
AC_OUTPUT
