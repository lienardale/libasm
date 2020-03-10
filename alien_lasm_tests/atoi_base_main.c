/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   atoi_base_main.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alienard <alienard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/03/10 12:29:37 by alienard          #+#    #+#             */
/*   Updated: 2020/03/10 14:00:30 by alienard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mainlibasm.h"

void	ft_atoi_base_main(void)
{
	char	*str;
	char	*inv_str;
	char	*base;
	char	*inv_base;
	int		ret;

	str = "12";
	base = "01";
	base = "0123456789";
	base = "0123456789ABCDEF";
	str = "";
	base = "poneyvif";

	inv_base = "1";
	inv_base = "";
	inv_base = "0123456788";
	inv_base = NULL;

}