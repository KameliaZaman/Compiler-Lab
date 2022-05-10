%option noyywrap
%{
	#include<stdio.h>
	int up=0;
	int low=0;
%}
uppercase [A-Z]
lowercase [a-z]
special "\n"|"\t"|"\v"|"\b"|"\r"|"\f"|"\a"|"\\"|"\?"|"\'"|"\""|"\ooo"|"\xhhh"|"\0"
%%
{uppercase}* {up++; printf("Uppercase letter found: %s\n",yytext);}
{lowercase}* {low++; printf("Lowercase letter found: %s\n",yytext);}
{special}* {printf("Special charater found: %s\n",yytext);}
%%
int main()
{
	yylex();
	printf("Total uppercase %s and total lowercase %s",up,low);
	return 0;
}