/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   strcmp_main.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alienard <alienard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/10/08 18:43:30 by alienard          #+#    #+#             */
/*   Updated: 2020/03/10 11:27:32 by alienard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../mainlibasm.h"

static void	ft_catch_segfault(int i)
{
	(void)i;
	green();
	printf("segfault 1 ft_strcmp ok\n");
	reset();
	_exit(0);
}

int			main(void)
{
	int tmp;
	
	signal(SIGSEGV, &ft_catch_segfault);
	tmp = ft_strcmp(NULL, "test");
	red();
	printf("segfault 1 ft_strcmp not ok\n");
	reset();
}
