#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>

size_t	ft_write(int fildes, const void *buf, size_t nbyte);
size_t	ft_strlen(const char *s);
char	*ft_strcpy(char * dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strdup(const char *s1);

int main(void)
{
	char	*str;
	char	*tab;
	char	tab_0[7];
	char	tab_1[7];
	char	buffer_0[7];
	char	buffer_1[7];
	int		fd;
	int		ret;

	str = "coucou";
	tab = "coucou";
	printf("   strlen<|%lu|\n", strlen(str));
	printf("ft_strlen>|%lu|\n", ft_strlen(str));
	write(1, "   write<|coucou|\n", 18);
	ft_write(1, "ft_write<|coucou|\n", 18);
	printf("   strcpy<|%s|\n",strcpy(tab_0, str));
	printf("ft_strcpy>|%s|\n",ft_strcpy(tab_1, str));
	printf("   strcmp<|%d|\n", strcmp(tab, str));
	printf("ft_strcmp>|%d|\n", ft_strcmp(tab, str));
	tab = "culcul";
	printf("   strcmp<|%d|\n", strcmp(tab, str));
	printf("ft_strcmp>|%d|\n", ft_strcmp(tab, str));
	fd = open("test", O_RDONLY);
	ret = read(fd, buffer_0, 6);
	printf("   read<ret:|%d|	buff:|%s|\n", ret, buffer_0);
	ret = ft_read(fd, buffer_1, 6);
	printf("ft_read>ret:|%d|	buff:|%s|\n", ret, buffer_1);
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, buffer_0, 6);
	printf("   read<ret:|%d|	buff:|%s|\n", ret, buffer_0);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	ret = ft_read(fd, buffer_1, 6);
	printf("ft_read>ret:|%d|	buff:|%s|\n", ret, buffer_1);
	close(fd);
	printf("   strdup<|%s|\n", strdup(str));
	printf("ft_strdup>|%s|\n", ft_strdup(str));
	return (0);
}