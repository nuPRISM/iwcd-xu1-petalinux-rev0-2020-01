APP = clock-cleaner-i2c

# Add any other object files to this list below
APP_OBJS = clock-cleaner-i2c.o
APP_OBJS += clc-i2c.o

all: build

build: $(APP)

$(APP): $(APP_OBJS)
	$(CC) -o $@ $(APP_OBJS) $(LDFLAGS) $(LDLIBS)
clean:
	rm -f $(APP) *.o

