%option noyywrap
%{
#include <stdio.h>
%}

DIGIT [0-9]
NONZERO [1-9]
NUMBER "0"|{NONZERO}{DIGIT}*
WHITESPACE [ \t\n\r]

%%
{NUMBER}	{ printf("Integer: %s (%d)\n", yytext, atoi(yytext)); }
"^"|"+"|"%"|"!"|"-"|"*"|"§"|"("|")"	printf("Operation '%s'\n", yytext);
{WHITESPACE}+	/* ignore whitespaces */
"E" {
	printf("Exiting the calculator.\n");
	return 0;
}
. {
	printf("Unrecognized token: '%s' Exiting!\n", yytext);
	return 1;
}
%%
main(argc, argv)
int argc;
char **argv;
{
	/* skip over program name */
	++argv, --argc;
	if (argc > 0)
		yyin = fopen(argv[0], "r"); /*Is the input file given?*/
	else
		yyin = stdin;
	return yylex();
}

int yyerror() 
{
	printf("Error\n");
	exit(1);
}
