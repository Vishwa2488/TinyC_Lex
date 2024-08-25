SHELL=/bin/sh

GCC=gcc

LEX=lex

all=main.c lex.yy.c

lexer: clean $(all)q
	gcc main.c -o lexer
	./lexer < $(file)

lex.yy.c: reader.l
	lex reader.l

clean:
	rm -f lex.yy.c lexer

