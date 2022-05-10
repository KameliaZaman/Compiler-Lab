%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h"
%}
keyword "class"|"extends"|"public"|"implements"|"final"|","
letter [a-zA-Z]
digit [0-9]
delim [ \t\n]
ws {delim}
%%
{ws} {yylval = atoi(yytext);
		return whitespace;};
{keyword} {yylval = atoi(yytext);
		return keyword;}
"_"*{letter}+{digit}* {yylval = atoi(yytext);
		return identifier;}


%%
int main()
{

	return 0;
}