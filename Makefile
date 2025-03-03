##
## EPITECH PROJECT, 2025
## Wolfram
## File description:
## Makefile
##

NAME = wolfram

all: build

build:
	stack build
	cp `stack path --local-install-root`/bin/$(NAME) ./$(NAME)

run: build
	./$(NAME)

clean:
	stack clean
	rm -rf bin/

fclean: clean
	rm -f $(NAME)

re: fclean all
