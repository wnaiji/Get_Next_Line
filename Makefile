# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: walidnaiji <walidnaiji@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/25 18:05:02 by wnaiji            #+#    #+#              #
#    Updated: 2023/06/25 18:06:41 by walidnaiji       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC = get_next_line.c \
	get_next_line_utils.c \

OBJ_DIR = obj
OBJS = $(addprefix $(OBJ_DIR)/,$(SRC:.c=.o))

NAME = get_next_line.a

CFLAGS = -Werror -Wextra -Wall
SUCCESS_MSG = "\033[0;32mCompilation successful. $(NAME) created.\033[0m"
ERROR_MSG = "\033[0;31mCompilation failed.\033[0m"

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(OBJ_DIR)
	@gcc $(CFLAGS) -I . -c $< -o $@
	@printf "\rCompiling: $<"

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@printf "\n"
	@printf $(SUCCESS_MSG)

all: $(NAME)

clean:
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -rf $(NAME)

re: fclean all
