#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include "libasm.h"
#include <stdlib.h>

void oui();

int main(int argc, char **argv) {
	size_t length = ft_strlen(argv[1]);
	
	printf("ft_strlen Length of the string: %zu\n", length);
	char str[5];
	(void)ft_strcpy(str, argv[1]);
	printf("ft_strlen String: '%s'\n", str);
	strcpy(str, "zzz");
	printf("strcmp : %i\n", ft_strcmp(str, argv[1]));
	// printf("strcmp : %i\n", strcmp(str, argv[1]));
	printf("write return : '%i'\n", ft_write(55, "Hello, World!\n", 14));
	printf("errno        : '%d'\n", errno);
	errno = 0;

	// printf("%i\n", ft_read(0, str, 5));
	// printf("readed : '%s'\n", str);
	char *str2 = NULL;
	printf("%p\n", str2);
	str2 = ft_strdup(str);
	printf("'%s'\n", str2);
	free(str2);
	return 0;
}