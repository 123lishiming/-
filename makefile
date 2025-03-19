.PHONY:all clean
CC = arm-linux-gnueabi-gcc
SCRS = $(wildcard *.c)
OBJS = $(SCRS:.c=.o)
DEPS = $(SRCS:.c=.d)
BIN = a.out


all: $(DEPS) $(OBJS) $(BIN)
ifneq ("$(wildcard $(DEPS))", "")
include $(DEPS)
endif
$(BIN): $(OBJS)
	$(CC) -o $@ $^
%.o:%.c
	$(CC) -o $@ -c $(filter %.c,$^)
%.d:%.c
	$(CC) -MM $^ > $@
clean:
	rm -rf $(BIN) $(OBJS) $(DEPS)
