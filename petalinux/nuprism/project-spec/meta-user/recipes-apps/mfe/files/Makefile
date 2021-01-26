APP = mfe

# Add any other object files to this list below
APP_OBJS = mfe.o

LDLIBS = -lmidas -lmfe -lpthread -lrt -lutil

all: build

build: $(APP)

clean:
	rm -f $(APP) $(APP_OBJS)

$(APP): $(APP_OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)
