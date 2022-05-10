%{
#include<stdio.h>
void yyerror(char *);
#include "y.tab.h"
%}

AND [Aa][Nn][Dd] 
OR [Oo][Rr] 
NOT [Nn][Oo][Tt] 
TRUE [Tt][Rr][Uu][Ee]
FALSE [Ff][Aa][Ll][Ss][Ee]

%%

{AND} { return (AND); } 
{OR} { return (OR); } 
{NOT} { return (NOT); } 
{TRUE} { yylval = 1; return (TRUE); } 
{FALSE} { yylval = 0; return (FALSE); }

[()\n] return *yytext;
[ \t] ; /* skip whitespace */
.        yyerror("invalid character");

%%
int yywrap(void) {
return 1;
}