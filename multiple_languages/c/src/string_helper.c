#include <string_helper.h>
#include <string.h>


void add_newline(char *string)
{
    int string_length = strlen(string);

    string[string_length - 1] = '\n';
}