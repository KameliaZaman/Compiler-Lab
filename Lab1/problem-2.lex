%option noyywrap

%{

#include<iostream>
using namespace std;

%}

arithmetic_operator "+"|"-"|"*"|"/"|"%"|"++"|"--"
relational_operator "=="|"!="|">"|"<"|">="|"<="
logical_operator "&&"|"||"|"!"

%%

{arithmetic_operator} {cout<<"Found arithmetic operator: "<<yytext<<endl;}
{relational_operator} {cout<<"Found relational operator: "<<yytext<<endl;}
{logical_operator} {cout<<"Found logical operator: "<<yytext<<endl;}

%%

int main()
{
yylex();
getchar();
return 0;
}
