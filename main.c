#include <stdio.h>
#include "lex.yy.c"


char * MACRO_STRING[100] = {NULL};

void initialise_macro_to_string()
{
    MACRO_STRING[KEYWORD] = "keyword";
    MACRO_STRING[KEYWORD_TYPE] = "type";
    MACRO_STRING[KEYWORD_DECLARATIONS] = "declarations";
    MACRO_STRING[KEYWORD_UDT] = "user-defined-function";
    MACRO_STRING[KEYWORD_IFELSE] = "if else keyword";
    MACRO_STRING[KEYWORD_SWITCHCASE] = "case switch keyword";
    MACRO_STRING[KEYWORD_LOOPER] = "looping keyword";
    MACRO_STRING[KEYWORD_GENERAL] = "return or void";
    MACRO_STRING[KEYWORD_OTHERS] = "goto/sizeof/register/inline";
    MACRO_STRING[IDENTIFIER] = "identifier";
    MACRO_STRING[CONSTANT] = "constant";
    MACRO_STRING[CONST_INTEGER] = "constant integer";
    MACRO_STRING[CONST_FLOAT] = "constant float";
    MACRO_STRING[STRING_LITERAL] = "string literal";
    MACRO_STRING[PUNCTUATORS] = "punctuations";
    MACRO_STRING[COMMENT_SINGLELINE] = "singleline comment";
    MACRO_STRING[COMMENT_MULTILINE] = "multiline comment";

    return ;
}


int main()
{
    initialise_macro_to_string();

    int nextok;

    while (nextok = yylex())
    {
        if (nextok != DELIM && nextok != COMMENT_MULTILINE && nextok != COMMENT_SINGLELINE) printf("%s    (%s)\n", MACRO_STRING[nextok], yytext);
        
    }
    return 0;
}