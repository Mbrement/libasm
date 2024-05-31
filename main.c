#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include "libasm.h"
#include <stdlib.h>

// void oui();

size_t _ft_strlen(const char *str);
char *_ft_strcpy(char *dest, const char *src);
int _ft_strcmp(const char *s1, const char *s2);
int _ft_write(int fd, const void *buf, size_t count);
int _ft_read(int fd, void *buf, size_t count);
char *_ft_strdup(char *str);
int _ft_atoi_base(const char *str, char *base);
int _ft_index(char c, const char *str);

int main(int argc, char **argv) {
	// size_t length = _ft_strlen(argv[1]);
	size_t length = strlen(argv[1]);
	
	printf("ft_strlen Length of the string: %zu\n", length);
	char *str;
	str = (char *)malloc(sizeof(char) * 1000);
	(void)_ft_strcpy(str, argv[1]);
	// (void)strcpy(str, argv[1]);
	printf("ft_strlen String: '%s'\n", str);
	// strcpy(str, "zzz");
	printf("strcmp : %i\n", _ft_strcmp(str, argv[1]));
	printf("strcmp : %i\n", strcmp(str, argv[1]));
	printf("write return : '%i'\n", _ft_write(55, "Hello, World!\n", 14));
	printf("errno        : '%d'\n", errno);
	errno = 0;

	// printf("%i\n", ft_read(0, str, 5));
	printf("readed : '%s'\n", str);


	char *str2 = NULL;
	char *tmp = strdup("Hello, World!");
	printf("%p\n", str2);
	str2 = _ft_strdup(tmp);
	printf("%s\n", str2);
	free(tmp);
	printf("'%p'\n", str2);
	free(str2);



	int atoi_result = _ft_atoi_base("2", "12");
	printf("%i\n", atoi_result);


	t_list *pouet = _ft_create_elem(str);

	printf("str ptr     '%p'\n", str);
	printf("starting list\n");
	printf("list ptr    '%p'\n", pouet);
	printf("str ptr     '%p'\n", str);
	printf("content ptr '%p'\n", pouet->content);
	printf("str in list '%s'\n", (char *)pouet->content);
	_ft_list_push_front(&pouet, "cookie");
	// t_list *pouet2 = pouet->next;
	printf ("\nnext list\n");
	printf ("new  ptr    '%p'\n", pouet);
	printf ("content ptr '%s'\n", (char *)pouet->content);
	printf ("next ptr    '%p'\n", pouet->next);
	printf ("nxt_ptr_cnt '%p'\n", pouet->next->content);
	printf ("next content'%s'\n", (char *)pouet->next->content);
	// printf("content ptr '%p'\n", pouet2->content);

	_ft_list_push_front(&pouet, "4");
	_ft_list_push_front(&pouet, "cookie");
	_ft_list_push_front(&pouet, "qdasdasdasdasdasasdasdasdasdasa");
	_ft_list_push_front(&pouet, "3");
	_ft_list_push_front(&pouet, "1");
	_ft_list_push_front(&pouet, "2");
	
	printf("list size : %i\n", _ft_list_size(pouet));
	
// _ft_list_swap(pouet,pouet->next->next->next);

		t_list *tmp_list = pouet;
	while (pouet->next)
	{
		t_list *tmp = pouet;
		printf("%s | ", (char *)pouet->content);
		pouet = pouet->next;
	}
	printf("%s\n", (char *)pouet->content);
	pouet = tmp_list;
	_ft_list_sort(&pouet, &_ft_strcmp);
	// int ww = _ft_list_exec(pouet->next, pouet, &_ft_strcmp);

	while (pouet->next)
	{	
		t_list *tmp = pouet;
		printf("%s | ", (char *)pouet->content);
		pouet = pouet->next;
		free(tmp);
	}
	printf("%s\n", (char *)pouet->content);

	free(str);
	free(	pouet);


	return 0;
}