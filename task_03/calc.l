%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "calc.tab.h"
%}

DIGIT [0-9]
NONZERO [1-9]
NUMBER "0"|{NONZERO}{DIGIT}*
WHITESPACE [ \t\n\r]

%%

{NUMBER} {
	printf("Integer: %s (%d)\n", yytext, atoi(yytext));
	//yylval=atoi(yytext);
	return NUMBER;
}
"^" {
	printf("Power\n");
	return POWER;
}
"+" {
	printf("Addition\n");
	return ADDITION;
}
"%" {
	printf("Reminder\n");
	return REMINDER;
}
"!" {
	printf("Factorial\n");
	return FACTORIAL;
}
"-" {
	printf("Subtraction\n");
	return SUBTRACTION;
}
"*" {
	printf("Multiplication\n");
	return MULTIPLICATION;
}
"§" {
	printf("Base-convert\n");
	return BASE_CONVERT;
}
\( { 
	printf("Bracket Begin\n");
	return OBRACE;
}
\) {
	printf("Bracket End\n");
	return EBRACE;
}
{WHITESPACE}+	/* ignore whitespaces */;
"E" {
	printf("Exiting the calculator.\n");
	return 0;
}
. {
	printf("Unrecognized token: '%s' Exiting!\n", yytext);
	return 1;
}

%%

//int main(argc, argv)
//int argc;
//char **argv;
//{
//	/* skip over program name */
//	++argv, --argc;
//	if (argc > 0)
//		yyin = fopen(argv[0], "r"); /*Is the input file given?*/
//	else
//		yyin = stdin;
//	
//	yylex();
//
//	return 0;
//}
