#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
 * infinite_while - Pauses process for 1 second
 *
 * Return: Nothing
 */

int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - Creates zombie processes
 *
 * Return: 0 (success)
 */

int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();

		if (pid == 0)
		{
			break;
		}

		printf("Zombie process created, PID: %d\n", pid);
	}

	if (pid < 0)
	{
		perror("fork");
		exit(1);
	}

	else if (pid > 0)
	{
		infinite_while();
	}

	return (0);
}
