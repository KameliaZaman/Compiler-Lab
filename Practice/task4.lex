%option noyywrap
%{
	#include<stdio.h>
%}

dec [0-9]
hex [0-9A-F]

%%
{dec}+ {printf("Decimal found: %s\n",yytext);}
{hex}+ {printf("Hexa found: %s\n",yytext);}
%%
int main()
{
	yylex();
	return 0;
}