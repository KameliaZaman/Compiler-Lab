%option noyywrap
%{
#include<bits/stdc++.h>
using namespace std;
void yyerror(char *);
#include "y.tab.h"
%}
digit [0-9]
iden [a-zA-Z]
%%

{digit}+ {
yylval = atoi(yytext);
return INTEGER;
}

{iden}+ { 
yylval = *yytext- 'a';
 return LETTER;
 }

[-+*/=()\n] return *yytext;
[ \t] ; /* skip whitespace */
.        yyerror("invalid character");

%%
int main()
{
	yylex();	
	return 0;
}