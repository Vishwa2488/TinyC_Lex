lexer: clean main.c lex.yy.c
	gcc main.c -o lexer
	./lexer < tester.c

lex.yy.c: reader.l
	lex reader.l

clean:
	rm -f lex.yy.c lexer

