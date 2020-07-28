%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"

extern int yyerror (char const *s, ...);
%}

DIGIT [0-9]
NONZERO [1-9]
NUMBER "0"|{NONZERO}{DIGIT}*
WHITESPACE [ \t]
NEWLINE [\n\r]

%%

{NUMBER} {
	printf("[L] Integer: %d\n", atoi(yytext));
	yylval=atoi(yytext);
	return INTEGER;
}
"^" {
	printf("[L] Power\n");
	return POWER;
}
"+" {
	printf("[L] Addition\n");
	return ADDITION;
}
"%" {
	printf("[L] Reminder\n");
	return REMINDER;
}
"!" {
	printf("[L] Factorial\n");
	return FACTORIAL;
}
"-" {
	printf("[L] Subtraction\n");
	return SUBTRACTION;
}
"*" {
	printf("[L] Multiplication\n");
	return MULTIPLICATION;
}
"§" {
	printf("[L] Base-convert\n");
	return BASE_CONVERT;
}
"(" { 
	printf("[L] Bracket Begin\n");
	return OBRACE;
}
")" {
	printf("[L] Bracket End\n");
	return EBRACE;
}
{NEWLINE} {
	printf("[L] Newline\n");
	return END;
}
{WHITESPACE}+	/* ignore whitespaces */;
"E"|"e" {
	printf("[L] Exiting the calculator.\n");
	return 0;
}
. {
	yyerror("[L] Unrecognized token: '%s' Exiting!\n", yytext);
}

%%
