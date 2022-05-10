%option noyywrap

%{

#include<iostream>
using namespace std;

int countHex=0;
int countDec=0;

%}

dec [0-9]
hex [0-9A-F]

%%

{dec}+ {cout<<"Found decimal number: "<<yytext<<endl; countDec++;} 
{hex}+ {cout<<"Found hexadecimal number: "<<yytext<<endl; countHex++;} 

%%

int main()
{
yylex();
cout<<"Total number of decimal numbers: "<<countDec<<endl;
cout<<"Total number of hexdecimal numbers: "<<countHex<<endl;
getchar();
return 0;
}
