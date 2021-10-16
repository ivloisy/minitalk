/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ivloisy <ivloisy@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/08 15:40:44 by ivloisy           #+#    #+#             */
/*   Updated: 2021/10/16 13:07:34 by ivloisy          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static t_char	g_sended;

void	display_string(int n)
{
	g_sended.c += ((n & 1) << g_sended.bit);
	g_sended.bit++;
	if (g_sended.bit == 15)
	{
		if (!g_sended.c)
			ft_putchar_fd('\n', 1);
		ft_putchar_fd(g_sended.c, 1);
		g_sended.c = 0;
		g_sended.bit = 0;
	}
}

int	main(void)
{
	g_sended.c = 0;
	g_sended.bit = 0;
	ft_putstr_fd("PID : ", 1);
	ft_putnbr_fd(getpid(), 1);
	ft_putchar_fd('\n', 1);
	while (1)
	{
		signal(SIGUSR1, display_string);
		signal(SIGUSR2, display_string);
		pause();
	}
	exit(EXIT_SUCCESS);
}
