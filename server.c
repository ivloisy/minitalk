/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ivloisy <ivloisy@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/08 15:40:44 by ivloisy           #+#    #+#             */
/*   Updated: 2021/10/16 21:25:04 by ivloisy          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static t_char	g_sended;

void	caca(int n)
{
/*	g_sended.c += ((n & 1) << g_sended.bit);
	g_sended.bit++;
	if (g_sended.bit == 7)
	{
		if (!g_sended.c)
			ft_putchar_fd('\n', 1);
		ft_putchar_fd(g_sended.c, 1);
		g_sended.c = 0;
		g_sended.bit = 0;
	}*/
	g_sended.bit++;
	g_sended.c <<= 1;
	if (n == SIGUSR1)
		g_sended.c++;
	if (g_sended.bit == 8)
	{
		if (!g_sended.c)
			ft_putchar_fd('\n', 1);
		write(1, &g_sended.c, 1);
		g_sended.bit = 0;
		g_sended.c = 0;
	}
}

int	main(void)
{
	struct sigaction	act;

	act.sa_handler = caca;
	ft_putstr_fd("PID : ", 1);
	ft_putnbr_fd(getpid(), 1);
	ft_putchar_fd('\n', 1);
	while (1)
	{
		if (sigaction(SIGUSR1, &act, NULL) < 0)
			return (1);
		if (sigaction(SIGUSR2, &act, NULL) < 0)
			return (1);
		pause();
	}
	exit(EXIT_SUCCESS);
}
