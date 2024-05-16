#include <string_helper.h>
#include <stdio.h>

int main()
{
    char a[5] = {'a', 'b', 'c', 'd', '\0'};

    add_newline(a);

    for (int i = 0; i < 5; ++i)
    {
        printf("Character is: %d \n", a[i]);
    }
}