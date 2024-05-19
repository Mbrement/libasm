# OBJS_DIR	=	.objs
# SRCS_DIR	=	sources

# SRCS		=	main.c
# OBJS		=	$(patsubst %.c, $(OBJS_DIR)/%.o, $(SRCS))
# ASM_SRCS	=	$(shell find $(SRCS_DIR) -name "*.s")
# ASM_OBJS	=	$(patsubst $(SRCS_DIR)/%.s, $(OBJS_DIR)/%.o, $(ASM_SRCS))

# NAME		=	libasm

# all: $(OBJS) $(ASM_OBJS)
# 	gcc -fPIE -pie -g  $(SRCS) -o $(NAME) $(ASM_OBJS) -lc

# $(OBJS_DIR)/%.o: %.c
# 	mkdir -p $(@D)
# 	gcc -fPIE -pie -g -c $< -o $@ -lc

# $(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
# 	mkdir -p $(@D)
# 	nasm -felf64  $< -o $@ 

# clean:
# 	rm -rf $(OBJS_DIR)

# fclean: clean
# 	rm -f $(NAME)

# re: fclean all
OBJS_DIR	= .objs
SRCS_DIR	= sources

SRCS		= main.c
OBJS		= $(patsubst %.c, $(OBJS_DIR)/%.o, $(SRCS))
ASM_SRCS	= $(shell find $(SRCS_DIR) -name "*.s")
ASM_OBJS	= $(patsubst $(SRCS_DIR)/%.s, $(OBJS_DIR)/%.o, $(ASM_SRCS))

LIB_NAME	= libasm.a
EXE_NAME	= libasm_exec

all: $(LIB_NAME) $(EXE_NAME)

$(LIB_NAME): $(ASM_OBJS)
	ar rcs $@ $^

$(EXE_NAME): $(OBJS) $(LIB_NAME)
	gcc -fPIE -pie -g -o $@ $(OBJS) -L. -lasm -lc

$(OBJS_DIR)/%.o: %.c
	mkdir -p $(@D)
	gcc -fPIE -pie -g -c $< -o $@

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.s
	mkdir -p $(@D)
	nasm -f elf64 $< -o $@

clean:
	rm -rf $(OBJS_DIR)

fclean: clean
	rm -f $(LIB_NAME) $(EXE_NAME)

re: fclean all