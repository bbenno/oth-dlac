%code requires {
	#define YYSTYPE unsigned long
}

%{
	#include <stdarg.h>	/* va_start, va_list, va_end */
	#include <stdio.h>	/* printf */
	#include <stdlib.h>	/* exit */
	#include "functions.h"	/* base_convert, factorial, power */

	int yyerror(const char*, ...);
	
	extern int yylex(void);
	extern FILE* yyin;
%}

%token INTEGER
%token POWER ADDITION REMINDER FACTORIAL SUBTRACTION MULTIPLICATION BASE_CONVERT
%token OBRACE EBRACE
%token END

%start syntax

%%

syntax:
	| syntax expr
	;

expr:
	END
	|
	expr_bse END { printf("Result: %d\n", $1); $$ = $1; }
	;

expr_bse:
	expr_add
	|
	expr_bse BASE_CONVERT expr_add { $$ = base_convert($1, $3); }
	;
expr_add:
	expr_mul
	|
	expr_add ADDITION expr_mul { $$ = $1 + $3; }
	|
	expr_add SUBTRACTION expr_mul { $$ = $1 - $3; }
	;
expr_mul:
	expr_pow
	|
	expr_mul MULTIPLICATION expr_pow { $$ = $1 * $3; }
	|
	expr_mul REMINDER expr_pow { $$ = $1 % $3; }
	;
expr_pow:
	expr_fac
	|
	expr_pow POWER expr_fac { $$ = power($1, $3); }
	;
expr_fac:
	factor
	|
	expr_fac FACTORIAL { $$ = factorial($1); }
	;
factor:
	OBRACE expr_bse EBRACE { $$ = $2; }
	|
	INTEGER { $$ = $1; }
	;

%%

int yyerror(const char *fmt, ...) {
	char* string;

	va_list args;

	va_start(args, fmt);
	vasprintf(&string, fmt, args);
	va_end(args);

	fprintf(stderr, string);

	exit(1);
}

int main(int argc, char** argv) {
	int status;
	++argv, --argc;
	if(argc > 0) {
		if(!(yyin = fopen(argv[0],"r"))) {
			FILE* temp = fopen("tmp.txt", "w");
			for (int i = 0; i<argc; i++)
				fprintf(temp, "%s\n", argv[i]);
			fclose(temp);
			yyin = fopen("tmp.txt", "r");
		}
		status = yyparse();
	}

	return status;
}
