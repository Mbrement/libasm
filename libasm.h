#ifndef	LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct s_list
{
	void *			content;
	struct s_list	*next;
}					t_list;

size_t _ft_strlen(const char *str);
char *_ft_strcpy(char *dest, const char *src);
int _ft_strcmp(const char *s1, const char *s2);
int _ft_write(int fd, const void *buf, size_t count);
int _ft_read(int fd, void *buf, size_t count);
char *_ft_strdup(char *str);
int _ft_atoi_base(const char *str, char *base);
void _ft_list_push_front(t_list **begin_list, void *data);
t_list *_ft_create_elem(void *data);
int _ft_list_size(t_list *begin_list);

int _ft_list_sort(t_list **begin_list, int (*cmp)());
void _ft_list_swap(t_list *a, t_list *b);

int _ft_list_exec(t_list *a, t_list *b, int (*f)());
#endif