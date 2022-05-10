%option noyywrap

%{

#include<iostream>
using namespace std;

int countUpper=0;
int countLower=0;

%}

special_character "\n"|"\t"|"\v"|"\b"|"\r"|"\f"|"\a"|"\\"|"\?"|"\'"|"\""|"\ooo"|"\xhhh"|"\0"
uppercase_character [A-Z]
lowercase_character [a-z]

%%

{special_character} {cout<<"Found special character"<<endl;}
{uppercase_character} {cout<<"Found uppercase character: "<<yytext<<endl; countUpper++;} 
{lowercase_character} {cout<<"Found lowercase character: "<<yytext<<endl; countLower++;} 

%%

int main()
{
yylex();
cout<<"Total number of uppercase characters: "<<countUpper<<endl;
cout<<"Total number of lowercase characters: "<<countLower<<endl;
getchar();
return 0;
}
