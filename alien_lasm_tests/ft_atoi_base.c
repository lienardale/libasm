/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alienard <alienard@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/08/15 08:54:30 by alienard          #+#    #+#             */
/*   Updated: 2020/03/10 13:55:47 by alienard         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

static int		ft_ln_base(char *str)
{
	int i;

	i = 0;
	while (str[i])
		i++;
	return (i);
}

static int		ft_check_base(char *base)
{
	int i;
	int j;

	i = -1;
	if (!base || ft_ln_base(base) <= 1)
		return (-1);
	while (base[++i])
	{
		if ((9 <= base[i] && base[i] <= 13) || base[i] == 32
				|| base[i] == '-' || base[i] == '+')
			return (-1);
		j = i;
		while (base[++j])
		{
			if (base[i] == base[j])
				return (-1);
		}
		j = -1;
	}
	return (1);
}

static int		ft_inbase(char s1, char *s2)
{
	int i;

	i = -1;
	while (s2[++i])
	{
		if (s1 == s2[i])
			return (i);
	}
	return (-1);
}

int				ft_atoi_base(char *str, char *base)
{
	int i;
	int ret;
	int neg;

	i = 0;
	ret = 0;
	neg = 1;
	if (ft_check_base(base) == -1)
		return (-1);
	while (((9 <= str[i] && str[i] <= 13) || str[i] == 32))
		i++;
	while ((str[i] == '-' || str[i] == '+'))
	{
		(str[i] == '-') ? neg = -neg : 0;
		i++;
	}
	while (ft_inbase(str[i], base) != -1)
	{
		ret = ret * ft_ln_base(base) + ft_inbase(str[i], base);
		i++;
	}
	return (ret * neg);
}
