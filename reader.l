
/* Auxilary Declarations */
%{
    #include <stdio.h>

    #define KEYWORD 10
    #define KEYWORD_TYPE 11
    #define KEYWORD_DECLARATIONS 12
    #define KEYWORD_UDT 13
    #define KEYWORD_IFELSE 14
    #define KEYWORD_SWITCHCASE 15
    #define KEYWORD_LOOPER 16
    #define KEYWORD_GENERAL 17
    #define KEYWORD_OTHERS 18
    #define IDENTIFIER 20
    #define CONSTANT 30
    #define CONST_INTEGER 31
    #define CONST_FLOAT 32
    #define STRING_LITERAL 40
    #define PUNCTUATORS 50
    #define COMMENT 60
    #define COMMENT_MULTILINE 61
    #define COMMENT_SINGLELINE 62

    #define DELIM 100
%}

/* Declarations */

/* ********************************* 1. Keywords *************************************/

types "short"|"long"|"int"|"char"|"Bool"|"float"|"auto"|"signed"|"unsigned"|"Complex"|"double"|"Imaginary" 

declarations "enum"|"const"|"volatile"|"static"|"restrict"|"extern" 

udt "typedef"|"union"|"struct"

general "return"|"void"

ifelse "if"|"else"

switchcase "switch"|"case"|"default"

looper "for"|"while"|"do"|"break"|"continue"

others "goto"|"sizeof"|"inline"|"register"



/******************************** 2. Identifers ************************************/

non_digit [_a-zA-Z]
digit     [0-9]
character [_a-zA-Z0-9]
identifer [_a-zA-Z][_a-zA-Z0-9]*


/******************************** 3. Constants ************************************/

nonzero_digit [1-9]
integer [1-9][0-9]*
digit_sequence [0-9]*




/******************************** 4. String Literals ************************************/







/******************************** 5. Punctuations ************************************/

compare ">"|"<"|"<="|">="|"=="|"!="
operator "++"|"--"|"-"|"+"|"*"|"/"|"%"
boolean_operators "&&"|"||"
eod ;
shift "<<"|">>"
bitwise "&"|"|" "

/*    . ->   & ~ !       ^ |            ? :  ...         = *= /= %= += -= <<= >>= &= ^= |=         , # */ 
brackets [\[\]\(\)\{\}]
space [\t ]
spaces [space]*
/******************************** 6. Comments ************************************/

start \/\*
end \*\/
singleline \/\/.*\n
line .*\n

/* Transition Rules */
%%

{start}.*{end}      { return COMMENT_MULTILINE; }
{types}          { return KEYWORD_TYPE; }
{declarations}   { return KEYWORD_DECLARATIONS; }
{udt}            { return KEYWORD_UDT; }
{general}        { return KEYWORD_GENERAL; }
{ifelse}         { return KEYWORD_IFELSE; }
{switchcase}     { return KEYWORD_SWITCHCASE; }
{looper}         { return KEYWORD_LOOPER; }
{others}         { return KEYWORD_OTHERS; }




{identifer}      { return IDENTIFIER; }


{integer}        { return CONST_INTEGER; }

{singleline}     { return COMMENT_SINGLELINE;}

{spaces} { return DELIM; }

%%

/* Auxillary Function */
int yywrap(void)
{
    return 1;
}