%{
	#include <stdio.h>
	int yyerror(const char*);
	int yylex(void);
%}

%token NUMBER POWER ADDITION REMINDER FACTORIAL SUBTRACTION MULTIPLICATION BASE_CONVERT OBRACE EBRACE

%%

syntax:
	| expr
	;

expr:
	expr_bse
	;

expr_bse:
	expr_add
	|
	expr_bse BASE_CONVERT expr_add
	;
expr_add:
	expr_mul
	|
	expr_add ADDITION expr_mul
	;
expr_mul:
	expr_pow
	|
	expr_mul MULTIPLICATION expr_pow
	|
	expr_mul REMINDER expr_pow
	;
expr_pow:
	expr_fac
	|
	expr_pow POWER expr_fac
	;
expr_fac:
	factor
	|
	expr_fac FACTORIAL
	;
factor:
	OBRACE expr EBRACE
	|
	NUMBER
	;

%%

int yyerror(const char *s) {
	fprintf(stderr, "%s\n", s);
	return 0;
}

int main(void) {
	yyparse();
	return 0;
}
