
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
    #define CONST_CHAR 33

    #define LITERAL 40
    #define STRING_LITERAL 41
    #define PUNCTUATORS 50
    #define COMMENT_MULTILINE 60
    #define COMMENT_SINGLELINE 61
    #define ERROR_TOKEN 70 
    #define DELIM 100
%}

/* Declarations */

/* ********************************* 1. Keywords *************************************/

types "short"|"lon g"|"int"|"char"|"Bool"|"float"|"auto"|"signed"|"unsigned"|"Complex"|"double"|"Imaginary" 

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
sign [+-]
digit_sequence [0-9]+
exp [eE]{sign}?{digit_sequence}
fractional_const ({digit_sequence})?\.{digit_sequence}|{digit_sequence}\.
float {fractional_const}{exp}?|{digit_sequence}{exp}




/******************************** 4. String Literals ************************************/
escape_sequence "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v" 
c_char [^\'\n\\']|{escape_sequence}
c_char_sequence {c_char}+

s_char [^\"\n\\']|{escape_sequence}
s_char_sequence {s_char}+

string_literal \"({s_char_sequence})?\"






/******************************** 5. Punctuations ************************************/

compare ">"|"<"|"<="|">="|"=="|"!="
operator "++"|"--"|"-"|"+"|"*"|"/"|"%"
boolean_operators "&&"|"||"
eod ;
shift "<<"|">>"
bitwise "&"|"|"|"^"|"~"

/*    . ->   & ~ !       ^ |            ? :  ...         = *= /= %= += -= <<= >>= &= ^= |=         , # */ 
brackets [\[\]\(\)\{\}]
space [ \n\t]
spaces [space]*
/******************************** 6. Comments ************************************/

%x multi_line_comment
%x single_line_comment


/* Transition Rules */
%%

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
{float}          { return CONST_FLOAT; }
{char}           { return CONST_CHAR; }

{string_literal} { return STRING_LITERAL; }

{compare}        { return PUNCTUATORS; }
{operator}       { return PUNCTUATORS; }
{boolean_operators} { return PUNCTUATORS; }
{eod}            { return PUNCTUATORS; }
{shift}          { return PUNCTUATORS; }
{bitwise}        { return PUNCTUATORS; }
{brackets}       { return PUNCTUATORS; }



{spaces} { return DELIM; }

"/*"                        {BEGIN(multi_line_comment); return COMMENT_MULTILINE;}
<multi_line_comment>"*/"    {BEGIN(INITIAL);}
<multi_line_comment>.       { }


"//"                        {BEGIN(single_line_comment); return COMMENT_SINGLELINE;}

<single_line_comment>.      { }


.                           { }

%%

/* Auxillary Function */
int yywrap(void)
{
    return 1;
}