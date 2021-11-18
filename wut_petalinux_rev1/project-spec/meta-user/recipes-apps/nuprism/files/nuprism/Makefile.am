EXTRA_DIST = configure doc/nuprism.man
SUBDIRS = doc

bin_PROGRAMS = adctest clctest

adctest_SOURCES = adc-test.c
adctest_CFLAGS = -I$(top_srcdir)/lib
adctest_LDADD = libnuprism.a

clctest_SOURCES = clc-test.c
clctest_CFLAGS = -I$(top_srcdir)/lib
clctest_LDADD = libnuprism.a


noinst_LIBRARIES = libnuprism.a
libnuprism_a_SOURCES = lib/gpio.c \
                       lib/clc.c \
                       lib/adc.c

libnuprism_a_CXXFLAGS = -I$(top_srcdir)/lib
