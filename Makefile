ASM_SRC := pi.s
CC      := clang
CFLAGS  := -arch arm64 -O2
LDFLAGS := -arch arm64

all: pi

pi: $(ASM_SRC)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f pi