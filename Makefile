# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alienard <alienard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/09 18:51:33 by alienard          #+#    #+#              #
#    Updated: 2020/03/12 17:29:34 by alienard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = 		libasm.a

SRCS =		./ft_strlen.s \
				./ft_strcpy.s \
				./ft_write.s \
				./ft_strcmp.s \
				./ft_read.s \
				./ft_strdup.s

SRCSBONUS =		./ft_atoi_base_bonus.s \
				./ft_list_push_front_bonus.s \
				./ft_list_size_bonus.s \
				./ft_list_sort_bonus.s \
				./ft_list_remove_if_bonus.s

SRCC =			main.c

OBJS = 		$(SRCS:.s=.o)

OBJSBONUS = 	$(SRCSBONUS:.s=.o)

OBJC			= $(SRCC:.c=.o)

AS = 		nasm

CC =		gcc

RM = 		rm -f

AR = 		ar rc

CFLAGS =	-Wall -Wextra -Werror

ASFLAGS =	-fmacho64

all:		$(NAME)

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)

bonus:		$(OBJS) $(OBJSBONUS)
			$(AR) $(NAME) $(OBJS) $(OBJSBONUS)

test:			all $(OBJC)
				$(CC) -L. -lasm $(OBJC)
				./a.out

clean:
			$(RM) $(OBJS) $(OBJSBONUS) $(OBJC)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		re all clean fclean bonus
