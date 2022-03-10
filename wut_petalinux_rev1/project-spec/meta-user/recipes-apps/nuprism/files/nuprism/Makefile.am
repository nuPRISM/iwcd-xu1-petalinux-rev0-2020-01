EXTRA_DIST = configure doc/nuprism.man
SUBDIRS = doc

bin_PROGRAMS = adctest clctest dmatest adcdmatest adcstream trigtest

adctest_SOURCES = adc-test.c
adctest_CFLAGS = -I$(top_srcdir)/lib
adctest_LDADD = libnuprism.a

clctest_SOURCES = clc-test.c
clctest_CFLAGS = -I$(top_srcdir)/lib
clctest_LDADD = libnuprism.a

dmatest_SOURCES = dma-proxy-test.c
dmatest_CFLAGS = -I$(top_srcdir)/lib 
dmatest_LDADD = libnuprism.a 
dmatest_LDADD +=-lpthread

adcdmatest_SOURCES = adc-dma-test.c
adcdmatest_CFLAGS = -I$(top_srcdir)/lib 
adcdmatest_LDADD = libnuprism.a 
adcdmatest_LDADD +=-lpthread

adcstream_SOURCES = adc-stream.c
adcstream_CFLAGS = -I$(top_srcdir)/lib 
adcstream_LDADD = libnuprism.a 
adcstream_LDADD +=-lpthread

trigtest_SOURCES = trigger-test.c
trigtest_CFLAGS = -I$(top_srcdir)/lib
trigtest_LDADD = libnuprism.a


noinst_LIBRARIES = libnuprism.a
libnuprism_a_SOURCES = lib/gpio.c \
                       lib/clc.c \
                       lib/adc.c \
                       lib/cfg.c

libnuprism_a_CXXFLAGS = -I$(top_srcdir)/lib
