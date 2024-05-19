#ifndef	LIBASM_H
# define LIBASM_H

#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

size_t _ft_strlen(const char *str);
char *_ft_strcpy(char *dest, const char *src);
int _ft_strcmp(const char *s1, const char *s2);
int _ft_write(int fd, const void *buf, size_t count);
int _ft_read(int fd, void *buf, size_t count);
char *_ft_strdup(char *str);
int _ft_atoi_base(const char *str, char *base);

#endif