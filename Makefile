SHELL=/bin/sh
LEX_FILE=ass3_22CS10061_22CS10074
C_FILE=ass3_22CS10074_22CS10061
TEST=ass3_22CS10074_22CS10061_test.c
GCC=gcc

LEX=lex

all=$(C_FILE).c lex.yy.c

lexer: clean $(all)
	gcc $(C_FILE).c -o lexer
	./lexer < $(TEST) > output.txt
	cat output.txt; 
	@echo "[INFO] Output is in output.txt";

lex.yy.c: $(LEX_FILE).l
	lex $(LEX_FILE).l

clean:
	rm -f output.txt lex.yy.c lexer

