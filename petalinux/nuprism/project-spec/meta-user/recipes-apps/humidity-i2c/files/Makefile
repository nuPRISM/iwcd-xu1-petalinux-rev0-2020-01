APP = humidity-i2c

# Add any other object files to this list below
APP_OBJS = humidity-i2c.o
APP_OBJS += hdc1080-i2c.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) -o $@ $(APP_OBJS) $(LDFLAGS) $(LDLIBS)
clean:
	rm -f $(APP) *.o

