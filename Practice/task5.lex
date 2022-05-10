%option noyywrap
%{
	#include<stdio.h>
	int chars=0;
	int lines=0;
	int words=0;
%}

character [0-9a-zA-Z]
line "\n"

%%

{character} {chars++; printf("character");}
{character}" " {words++; printf("word");}
{character}{line} {lines++; printf("line");}
{line} {lines++; printf("line");}

%%
int main()
{
	yylex();
	printf("total character: %s\n lines: %s\n words: %s\n",chars,lines,words);
	return 0;
}