# All notes are now in the Makefile template
NAME = libgetnextline.a

CC = cc
CFLAGS = -Wall -Wextra -Werror -I. -I ./98_include
LFLAGS = -L ./99_lib -lftprintf -lft

SRCS = 	get_next_line.c \
		get_next_line_utils.c \
# No bonus because kinda separate program and no need in future projects so far

OBJS = $(SRCS:.c=.o)

# If I'm on my own machine (campus or home), update the 98 & 99 Folders - UPDATE ALL MAKEFILES w/ home data (whoamI at home is not schappuy)
UPDATE_PERSO := $(shell whoami)
CURRENT_DIR = $(shell basename $$PWD)

ifeq ($(UPDATE_PERSO), schappuy)
ifeq ($(CURRENT_DIR), 03_Get_Next_Line)
		EXTRA := install
	endif
endif

ifeq ($(UPDATE_PERSO), prunelle)
ifeq ($(CURRENT_DIR), 03_Get_Next_Line)
		EXTRA := install
	endif
endif

all: $(NAME) $(EXTRA)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

install:
	cp get_next_line.h ../98_include
	cp libgetnextline.a ../99_lib

.PHONY: all clean fclean re install
