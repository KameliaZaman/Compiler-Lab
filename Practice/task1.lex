%option noyywrap
%{
	#include<stdio.h>
%}

keyword "int"|"float"|"if"|"then"|"else"|"for"|"printf"|"switch"|"case"|"return"
digit [0-9]

%%

{keyword} {printf("Keyword found: %s\n",yytext);}
{digit}+ {printf("Integer found: %s\n",yytext);}
{digit}+"."{digit}+ {printf("Floating point number found: %s\n",yytext);}

%%
int main()
{
	yylex();
	return 0;
}