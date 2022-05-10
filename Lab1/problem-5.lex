%option noyywrap

%{

#include<iostream>
using namespace std;

int countChar=0;
int countWord=0;
int countLine=0;

%}

line "\n"
char [0-9a-zA-Z]

%%

{line}+ {cout<<"Found a line"<<endl; countLine++;} 
{char}" " {cout<<"Found a word"<<endl; countWord++; countChar++;}
{char}{line} {cout<<"Found a character. Found a word. Found a line. "<<endl; countChar++; countWord++; countLine++;}
{char} {cout<<"Found a character"<<endl; countChar++;} 
. {cout<<"Found a character"<<endl; countChar++;} 

%%

int main()
{
yylex();
cout<<"Total number of lines: "<<countLine<<endl;
cout<<"Total number of words: "<<countWord<<endl;
cout<<"Total number of characters: "<<countChar<<endl;
getchar();
return 0;
}
