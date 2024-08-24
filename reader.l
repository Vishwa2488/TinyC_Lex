
/* Auxilary Declarations */
%{
    #include <stdio.h>

    /* Keyword macros */
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

    /* Constants macros */
    #define CONSTANT 30
    #define CONST_INTEGER 31
    #define CONST_FLOAT 32
    #define CONST_CHAR 33
    /* String Literal macros */
    #define STRING_LITERAL 40
    
    /* punctuations macros*/
    #define PUNCTUATORS 50
    #define PUNC_COMPARE 51
    #define PUNC_ARITHMETIC 52
    #define PUNC_LOGICAL 53
    #define PUNC_BITWISE 54
    #define PUNC_BRACKETS 55
    #define PUNC_EOD 56
    #define PUNC_SHIFT 57
    #define PUNC_SPL 58

    /* comments macros */
    #define COMMENT 60
    #define COMMENT_MULTILINE 61
    #define COMMENT_SINGLELINE 62
    #define NEWLINE 63
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
integer [1-9][0-9]*|"0"

/* floating point */
sign [+-]
digit_sequence [0-9]+
exp [eE]{sign}?{digit_sequence}
fractional_const ({digit_sequence})?\.{digit_sequence}|{digit_sequence}\.
float {fractional_const}{exp}?|{digit_sequence}{exp}



/******************************** 4. String Literals ************************************/

escape_sequence "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v" 
c_char \'[^\'\n\\']\'|\'{escape_sequence}\'
c_char_sequence {c_char}+ 

s_char [^\"\n\\']|{escape_sequence}
s_char_sequence {s_char}+

string_literal \"{s_char_sequence}?\"

/******************************** 5. Punctuations ************************************/

/* comparison, operator, boolean, shift, bitwise, do and assign */
compare ">"|"<"|"<="|">="|"=="|"!="
operator "++"|"--"|"-"|"+"|"*"|"/"|"%"
boolean "&&"|"||"
shift "<<"|">>"
bitwise "&"|"|"|"^"|"!"
do_assign "*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="

/* special characters */
colon ":"
question "?"
assign "="
tilda "~"
comma ","
hash "#"
something "..."
dot . 
pointer "->"
eod ;

spl_punc ":"|"?"|"="|"~"|","|"#"|"..."|"."|"->"|";"

/* brackets */
brackets [\[\]\(\)\{\}]
space [ \t\n]
spaces {space}*
/******************************** 6. Comments ************************************/

start \/\*
end \*\/
singleline \/\/.*\n
line .*\n
newline \n
all {line}|{newline}
multiline {all}*
/* Transition Rules */
%%

"/*"([^*]|\*+[^*/])*\*+"/"      { return COMMENT_MULTILINE; }

{types}          { return KEYWORD; }
{declarations}   { return KEYWORD; }
{udt}            { return KEYWORD; }
{general}        { return KEYWORD; }
{ifelse}         { return KEYWORD; }
{switchcase}     { return KEYWORD; }
{looper}         { return KEYWORD; }
{others}         { return KEYWORD; }




{identifer}      { return IDENTIFIER; }


{integer}        { return CONST_INTEGER; }
{float}          { return CONST_FLOAT; }
{c_char}         { return CONST_CHAR; }


{string_literal} { return STRING_LITERAL; }

{compare}        { return PUNC_COMPARE; }
{operator}       { return PUNC_ARITHMETIC; }
{boolean}        { return PUNC_LOGICAL; }
{eod}            { return PUNC_EOD; }
{spl_punc}       { return PUNC_SPL; }
{brackets}      { return PUNC_BRACKETS; }


{singleline}     { return COMMENT_SINGLELINE; }
{newline}        { return NEWLINE; }
{spaces} { return DELIM; }

%%

/* Auxillary Function */
int yywrap(void)
{
    return 1;
}