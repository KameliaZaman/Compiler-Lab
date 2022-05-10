%{
	#include<stdio.h>
	void yyerror(char *);
	#include "y.tab.h"
%}

%%

[0-9]+ { yylval=atoi(yytext); /*yyval links between yacc file*/
	return INTEGER;}

[-+*/()\n] return *yytext;

[ \t] ; /*skip whitespace*/

.        yyerror("invalid character");
%%
int yywrap(void)
{

	return 1;
}