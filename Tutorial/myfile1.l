%option noyywrap

%{

#include<stdio.h>
#include<stdlib.h>

%}

keyword "class"|"extends"|"public"|"implements"|"final"|","
letter [a-zA-Z]
digit [0-9]
delim [ \t\n]
ws {delim}+

%%
{ws} ;
{keyword} {printf("Keyword: %s\n",yytext);}
"_"*{letter}+{digit}* {printf("Identifier: %s\n",yytext);}
{digit}+{letter}+ {printf("Invalid Input: %s\n",yytext);}
. {printf("Invalid Input: %s\n",yytext);}

%%

int main()
{
yyin  = fopen("C:\\Users\\Lab-2\\Desktop\\New folder\\input.data", "r");
yylex();
fclose(yyin);
getchar();
return 0;
}
