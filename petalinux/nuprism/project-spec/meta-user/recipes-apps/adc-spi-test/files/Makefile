APP = adc-spi-test

# Add any other object files to this list below
APP_OBJS = adc-spi-test.o
APP_OBJS += adc-spi.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) -o $@ $(APP_OBJS) $(LDFLAGS) $(LDLIBS)
clean:
	rm -f $(APP) *.o

