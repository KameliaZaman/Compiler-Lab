%option c++
%option noyywrap
%{

#include<iostream>
using namespace std;

int countInt=0;
int countFloat=0;

%}

keyword "int"|"float"|"if"|"then"|"else"|"for"|"printf"|"switch"|"case"|"return"
digit [0-9]

%%

{keyword} {cout<<"Found keyword"<<endl;}
{digit}+ {cout<<"Found integer: "<<yytext<<endl; countInt++;} 
{digit}+"."{digit}+ {cout<<"Found floating point number: "<<yytext<<endl; countFloat++;}

%%

int main()
{
yylex();
cout<<"Total valid integers: "<<countInt<<endl;
cout<<"Total valid floating point numbers: "<<countFloat<<endl;
getchar();
getchar();
return 0;
}
