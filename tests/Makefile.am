AM_CPPFLAGS = -I$(top_srcdir)/include
AM_CXXFLAGS = $(WARN_CXXFLAGS) $(GTEST_CFLAGS)

TESTS = roshydb_tests
check_PROGRAMS = roshydb_tests

roshydb_tests_SOURCES = version_test.cpp
roshydb_tests_LDADD = $(top_builddir)/src/libroshydb.la $(GTEST_LIBS)
