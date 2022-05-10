%{
#include<stdio.h>
void yyerror(char *);
#include "y.tab.h"
%}

CLASS [Cc][Ll][Aa][Ss][Ss]
EXTENDS [Ee][Xx][Tt][Ee][Nn][Dd][Ss]
PUBLIC [Pp][Uu][Bb][Ll][Ii][Cc]
IMPLEMENTS [Ii][Mm][Pp][Ll][Ee][Mm][Ee][Nn][Tt][Ss]
FINAL [Ff][Ii][Nn][Aa][Ll]
IDENTIFIER [Ii][Dd][Ee][Nn][Tt][Ii][Ff][Ii][Ee][Rr]

%%

{CLASS} { return (CLASS); } 
{EXTENDS} { return (EXTENDS); } 
{PUBLIC} { return (PUBLIC); }
{IMPLEMENTS} { return (IMPLEMENTS); } 
{FINAL} { return (FINAL); } 
{IDENTIFIER} { return (IDENTIFIER); } 
[,\n] return *yytext;
[ \t] ; /* skip whitespace */
.        yyerror("invalid character");

%%
int yywrap(void) {

return 1;
}