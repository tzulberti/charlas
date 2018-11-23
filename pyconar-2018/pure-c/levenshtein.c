#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MIN3(a, b, c) ((a) < (b) ? ((a) < (c) ? (a) : (c)) : ((b) < (c) ? (b) : (c)))

#define MAX_NUMBER_OF_LINES_IN_FILE 1000000
#define MAX_LINE_LENGTH 256
#define PRINT_OUTPUT 0

int main(int argc, char* argv[])
{

    int i = 0;
    
    char const* const fileName = argv[1]; /* should check that argc > 1 */
    char **file_content = (char **) malloc(sizeof(char*) * MAX_NUMBER_OF_LINES_IN_FILE);
    FILE* file = fopen(fileName, "r"); /* should check the result */

    for (i=0; 1; i++) {
        file_content[i] = malloc(MAX_LINE_LENGTH);
        if (fgets(file_content[i], MAX_LINE_LENGTH-1, file) == NULL)
            break;

        /* Get rid of CR or LF at end of line */
        int j = 0;
        for (j = strlen(file_content[i]) - 1 ; j>=0 && (file_content[i][j]=='\n' || file_content[i][j]=='\r') ; j--) {
            i;
        }
        file_content[i][j+1]='\0';
    }
    fclose(file);

    do_logic(file_content, i);

    return 0;
}


int do_logic(char** file_content, int max_lines) {

    char *str1, *str2, *token;
    char *line_content;
    char *saveptr1;
    int i = 0;
    for (i = 0; i < max_lines; i++) {
        int first = 1;
        for (line_content = file_content[i]; ; line_content = NULL) {
            token = strtok_r(line_content, ",", &saveptr1);
            if (token == NULL)
                break;
            if (first == 1)
                str1 = token;
            else
                str2 = token;
            first = 0;
        }    
        if (PRINT_OUTPUT == 1)
            printf("%s %s %d\n", str1, str2, levenshtein(str1, str2));
    }
    return 1;
}

// taken from https://en.wikibooks.org/wiki/Algorithm_Implementation/Strings/Levenshtein_distance#C
int levenshtein(char *s1, char *s2) {
    unsigned int x, y, s1len, s2len;
    s1len = strlen(s1);
    s2len = strlen(s2);

    unsigned int matrix[s2len+1][s1len+1];
    matrix[0][0] = 0;

    for (x = 1; x <= s2len; x++)
        matrix[x][0] = x;
    for (y = 1; y <= s1len; y++)
        matrix[0][y] = y;

    for (x = 1; x <= s2len; x++)
        for (y = 1; y <= s1len; y++)
            matrix[x][y] = MIN3(
                matrix[x-1][y] + 1,
                matrix[x][y-1] + 1,
                matrix[x-1][y-1] + (s1[y-1] == s2[x-1] ? 0 : 1)
            );

    return (matrix[s2len][s1len]);
}
