/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ivloisy <ivloisy@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/08/11 11:26:37 by ivloisy           #+#    #+#             */
/*   Updated: 2021/10/16 13:07:45 by ivloisy          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

static int	is_good_pid(char *s)
{
	int	i;

	i = 0;
	while (s[i])
	{
		if (ft_isdigit(s[i]) == 0)
			return (0);
		i++;
	}
	return (1);
}

static void	send_string(int pid, char *s)
{
	size_t	i;
	int		j;

	i = 0;
	while (i <= ft_strlen(s))
	{
		j = 0;
		while (j < 15)
		{
			if ((s[i] >> j) & 1)
				kill(pid, SIGUSR2);
			else
				kill(pid, SIGUSR1);
			j++;
			usleep(100);
		}
		i++;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	if (ac == 2 || ac == 3)
	{
		if (is_good_pid(av[1]))
			pid = ft_atoi(av[1]);
		else
		{
			ft_putstr_fd("ERROR : it is not a valid PID.\n", 2);
			exit(EXIT_FAILURE);
		}
		if (ac == 3)
			send_string(pid, av[2]);
		else if (ac == 2)
		{
			ft_putstr_fd("ERROR : give a string to send on parameters.\n", 2);
			exit(EXIT_FAILURE);
		}
	}
	exit(EXIT_SUCCESS);
}
