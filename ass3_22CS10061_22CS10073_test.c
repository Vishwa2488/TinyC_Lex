/*
    Compilers Lab Assignment 3 Group Project
    Test File
    22CS10061: Vishwa Gangadhar   
    22CS10074: Siddharth Ambedkar
*/

/* Keywords and Identifiers */
short a = 1;
int b = 2;
long c = 3;
float d = 4.0;
char e = 'c';
const char f = 'u';
unsigned int g = 5;
signed int h = -6;
double i = 7.89;
Bool j = 1;
auto k = 10;
Complex l;
Imaginary m;
typedef struct { int x; int y; } Point;
Point p1;
union { int n; float o; } u;
enum { RED, GREEN, BLUE }   color;

/* Valid Identifiers */
int _123129aaas92 = 10;
float validIdentifier1 = 3.14;
char anotherVarName = 'a';
character_sequence s = 'abcdefghihgfedcba';
double _underscore_test = 1.23;
int identifier123 = 456;
unsigned long anotherExample = 7890;
const int example_const = 42;
long var_name_with_underscore = 1000;

/* Fractional Float Constants */
float frac1 = 123127e1231;
double frac2 = 123127e-1231;
float frac3 = 123.456;
double frac4 = 123.456e10;
float frac5 = 0000.123456;
double frac6 = 1.234567e-5;
float frac7 = 123127e1231;
double frac8 = 123127.12310e12;

/* Control structures */
if (a < b) {
    while (c > d) {
        for (int x = 0; x < 10; x++) {
            c--;
        }
    }
} else if (b == a) {
    switch (color) {
        case RED:
            p1.x = 1;
            break;
        case GREEN:
            p1.y = 2;
            break;
        default:
            break;
    }
} else {
    return;
}

/* Constants */
int p = 123;
float q = 456.789;
char r = 'r';
const float pi = 3.14159;
const double euler = 2.71828;
const int max_value = 1000;

/* String literals */
char* str = "Hello, World!";
char* path = "C:\\Users\\Name";

/* Punctuations */
int result = a + b * (c - d);
result <<= 2;
result &= ~1;
char punct = ';';

/* Comments */
int s = 42; // This is a single-line comment
/*
This is a 
multi-line comment
*/

/* Delimiters */
int array[5] = {1, 2, 3, 4, 5};
int *ptr = &a;