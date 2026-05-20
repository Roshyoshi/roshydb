AM_CPPFLAGS = -I$(top_srcdir)/include
AM_CXXFLAGS = $(WARN_CXXFLAGS)

lib_LTLIBRARIES = libroshydb.la
libroshydb_la_SOURCES = version.cpp
libroshydb_la_LDFLAGS = -version-info 0:0:0

bin_PROGRAMS = roshydb
roshydb_SOURCES = main.cpp
roshydb_LDADD = libroshydb.la
