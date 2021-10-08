# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivloisy <ivloisy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/10 20:51:05 by ivloisy           #+#    #+#              #
#    Updated: 2021/10/08 13:55:23 by ivloisy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server

NAME2 = client

CC = gcc

FLAG = -g -Wall -Werror -Wextra

#SRCDIR = sources

SRC = server.c

SRC2 = client.c

HDR = minitalk.h

OBJDIR = objects

OBJ = $(OBJDIR)/server.o

OBJ2 = $(OBJDIR)/client.o

LFT = libft/libft.a

all: $(NAME) $(NAME2)

$(NAME): $(LFT) $(OBJ)
	$(CC) $(FLAG) -o $@ $(OBJ) $(LFT)

$(NAME2): $(LFT) $(OBJ2)
	$(CC) $(FLAG) -o $@ $(OBJ2) $(LFT)

$(LFT): ./libft/*.c ./libft/*.h
	make -C libft/
	
$(OBJ): $(SRC) $(HDR) | $(OBJDIR)
	$(CC) $(FLAG) -o $@ -c $<

$(OBJ2): $(SRC2) $(HDR) | $(OBJDIR)
	$(CC) $(FLAG) -o $@ -c $<

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)
	make -C libft/ clean

fclean: clean
	rm -f $(NAME) $(NAME2)
	make -C libft/ fclean

re: fclean all

.PHONY: all clean fclean re