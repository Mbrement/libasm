#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

#include <stdlib.h>
size_t ft_strlen(const char *str);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
int ft_write(int fd, const void *buf, size_t count);
int ft_read(int fd, void *buf, size_t count);
char *ft_strdup(char *str);