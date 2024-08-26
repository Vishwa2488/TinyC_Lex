#include <stdio.h>
#include "lex.yy.c"


char * MACRO_STRING[100] = {NULL};

// Structure to store name and count of token

typedef struct _node {
   char * name;
   int count;
   struct _node *next;

} node;

// Defining symboltable
typedef node* symboltable;

// add node to symbol table 

symboltable addtbl ( symboltable T, char * id )
{
   node *p;
   p = T;
   while (p) {                  // Finding if the node is in symbol table
      if (!strcmp(p->name,id)) {
        p->count++;
         return T;
      }
      p = p -> next;
   }

   p = (node *)malloc(sizeof(node));        // adding node when node is not in table
   p->name = (char *)malloc(sizeof(char)*(strlen(id)+1));
   strcpy(p->name, id);
   p->count = 1;

   if (T == NULL) return p;
   node *q;
   q = T;
   while (q->next)                  // adding node to the end of the linked list
   {
        q = q->next;
   }
   q->next = p;
   return T;
}


void initialise_macro_to_string()
{
    MACRO_STRING[KEYWORD] = "KEYWORD";
    MACRO_STRING[KEYWORD_TYPE] = "TYPE";
    MACRO_STRING[KEYWORD_DECLARATIONS] = "DECLARATIONS";
    MACRO_STRING[KEYWORD_UDT] = "USER_DEFINED_TYPE";
    MACRO_STRING[KEYWORD_IFELSE] = "IF_ELSE_KEYWORDS";
    MACRO_STRING[KEYWORD_SWITCHCASE] = "CASE_SWITCH_KEYWORD";
    MACRO_STRING[KEYWORD_LOOPER] = "LOOPING_KEYWORD";
    MACRO_STRING[KEYWORD_GENERAL] = "RETURN/VOID KEYWORD";
    MACRO_STRING[KEYWORD_OTHERS] = "GOTO/SIZEOF/REGISTER/INLINE";
    MACRO_STRING[IDENTIFIER] = "IDENTIFIER";
    MACRO_STRING[CONSTANT] = "CONSTANT";
    MACRO_STRING[CONST_INTEGER] = "INTEGER CONSTANT";
    MACRO_STRING[CONST_FLOAT] = "FLOATING POINT CONSTANT";
    MACRO_STRING[CONST_CHAR]  = "CHARACTER CONSTANT";
    MACRO_STRING[STRING_LITERAL] = "STRING LITERAL";
    MACRO_STRING[PUNCTUATORS] = "PUNCTUATOR";
    MACRO_STRING[PUNC_COMPARE] = "COMPARISON OPERATOR";
    MACRO_STRING[PUNC_LOGICAL] = "LOGICAL OPERATOR";
    MACRO_STRING[PUNC_ARITHMETIC] = "ARITHMETIC OPERATOR";
    MACRO_STRING[PUNC_BITWISE] = "BITWISE OPERATOR";
    MACRO_STRING[PUNC_SPL] = "SPECIAL CHARACTER";
    MACRO_STRING[PUNC_EOD] = "END OF LINE CHARACTER";
    MACRO_STRING[PUNC_BRACKETS] = "SPECIAL CHARACTER";
    MACRO_STRING[CONST_CHAR_SEQUENCE] = "CHARACTER SEQUENCE";

    MACRO_STRING[COMMENT_SINGLELINE] = "singleline comment";
    MACRO_STRING[COMMENT_MULTILINE] = "multiline comment";

    return ;
}


void print_table(symboltable T)
{
    while (T!=NULL)
    {
        printf("%s\n", T->name);
        T = T->next;
    }
    return;
}

int main()
{
    initialise_macro_to_string();

    int nextok;
    symboltable T = NULL;
    while (nextok = yylex())
    {
        if (nextok == NEWLINE)
        {
            printf("\n");
            continue;
        }
        
        if (nextok == IDENTIFIER)
        {
            T = addtbl(T, yytext);
        }

        if (nextok != DELIM) 
        printf("<%s, %s>", MACRO_STRING[nextok], yytext);
        
    }
    printf("\n\n");
    printf("The identifiers in the file are\n");   
    print_table(T);
    printf("\n\n");
    return 0;
}