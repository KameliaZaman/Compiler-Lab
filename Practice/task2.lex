%option noyywrap
%{
	#include<stdio.h>
%}
arithmetic "+"|"-"|"*"|"/"|"%"|"++"|"--"
relational "<"|">"|"=="|">="|"<="|"!="
logical "&&"|"||"|"!"
%%
{arithmetic} {printf("Arithmetic operator found: %s\n",yytext);}
{relational} {printf("Relational operator found: %s\n",yytext);}
{logical} {printf("Logical operator found: %s\n",yytext);}
%%
int main()
{
	yylex();
	return 0;
}