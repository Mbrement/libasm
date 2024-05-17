OBJS_DIR	=	.objs
SRCS_DIR	=	sources

SRCS		=	#main.c
OBJS		=	$(patsubst %.c, $(OBJS_DIR)/%.o, $(SRCS))
ASM_SRCS	=	$(shell find $(SRCS_DIR) -name "*.s")
ASM_OBJS	=	$(patsubst $(SRCS_DIR)/%.s, $(OBJS_DIR)/%.o, $(ASM_SRCS))

NAME		=	libasm.a

all: $(OBJS) $(ASM_OBJS)
	ar rc -o $(NAME) $(ASM_OBJS)

$(OBJS_DIR)/%.o: %.c
	mkdir -p $(@D)
	gcc -g -c $< -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
	mkdir -p $(@D)
	nasm -felf64  $< -o $@ 

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all