# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ivloisy <ivloisy@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/10 20:51:05 by ivloisy           #+#    #+#              #
#    Updated: 2021/10/16 13:18:50 by ivloisy          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = server

NAME2 = client

BONUS = server_bonus

BONUS2 = client_bonus

CC = gcc

FLAG = -Wall -Werror -Wextra

SRC = server.c

SRC2 = client.c

BON = server_bonus.c

BON2 = client_bonus.c

HDR = minitalk.h

OBJDIR = objects

OBJ = $(OBJDIR)/server.o

OBJ2 = $(OBJDIR)/client.o

BOB = $(OBJDIR)/server_bonus.o

BOB2 = $(OBJDIR)/client_bonus.o

LFT = libft/libft.a

all: $(NAME) $(NAME2)

$(NAME): $(LFT) $(OBJ)
	@echo "\033[36m\nCompilation with libft\t\t\t\t🧱\n"
	$(CC) $(FLAG) -o $@ $(OBJ) $(LFT)
	@echo "\033[35m\n$@ has been created with success !\t\t🌈\n"

$(NAME2): $(LFT) $(OBJ2)
	@echo "\033[36m\nCompilation with libft\t\t\t\t🧱\n"
	$(CC) $(FLAG) -o $@ $(OBJ2) $(LFT)
	@echo "\033[35m\n$@ has been created with success !\t\t🌈\n"

$(LFT): ./libft/*.c ./libft/*.h
	make -C libft/
	
$(OBJ): $(SRC) $(HDR) | $(OBJDIR)
	@echo "\033[32m\nSources files compilation\t\t\t⚙️\n"
	$(CC) $(FLAG) -o $@ -c $<

$(OBJ2): $(SRC2) $(HDR) | $(OBJDIR)
	@echo "\033[32m\nSources files compilation\t\t\t⚙️\n"
	$(CC) $(FLAG) -o $@ -c $<

$(OBJDIR):
	mkdir -p $(OBJDIR)

bonus: $(BONUS) $(BONUS2)

$(BONUS): $(LFT) $(BOB)
	@echo "\033[36m\nCompilation with libft\t\t\t\t🧱\n"
	$(CC) $(FLAG) -o $@ $+
	@echo "\033[35m\n$@ has been created with success !\t\t🌈\n"

$(BONUS2): $(LFT) $(BOB2)
	@echo "\033[36m\nCompilation with libft\t\t\t\t🧱\n"
	$(CC) $(FLAG) -o $@ $+
	@echo "\033[35m\n$@ has been created with success !\t\t🌈\n"
	
$(BOB): $(BON) $(HDR) | $(OBJDIR)
	@echo "\033[32m\nSources files compilation\t\t\t⚙️\n"
	$(CC) $(FLAG) -o $@ -c $<

$(BOB2): $(BON2) $(HDR) | $(OBJDIR)
	@echo "\033[32m\nSources files compilation\t\t\t⚙️\n"
	$(CC) $(FLAG) -o $@ -c $<
	
clean:
	@echo "\033[33m\nRemove objects files\t\t--->\t\t🗑\n"
	rm -rf $(OBJDIR)
	make -C libft/ clean

fclean: clean
	@echo "\033[33m\nRemove all programs file\t\t--->\t\t🗑\n"
	rm -f $(NAME) $(NAME2) $(BONUS) $(BONUS2)
	make -C libft/ fclean

re: fclean all

.PHONY: all clean fclean re