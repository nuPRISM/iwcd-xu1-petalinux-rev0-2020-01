EXTRA_DIST = configure doc/nuprism.man
SUBDIRS = doc

bin_PROGRAMS = adctest

adctest_SOURCES = adc-test.c
adctest_CFLAGS = -I$(top_srcdir)/lib
adctest_LDADD = libnuprism.a


noinst_LIBRARIES = libnuprism.a
libnuprism_a_SOURCES = lib/gpio.c
libnuprism_a_CXXFLAGS = -I vsrc-lib
