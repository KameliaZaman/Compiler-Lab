%option noyywrap

%{

#include<iostream>
using namespace std;
int sline=0,mline=0;

%}

%%

"//".*"\n" {cout<<"Single line comment found. "<<yytext<<endl; sline++;}
"/*".*"\n"*.*"*/" {cout<<"Multi line comment found. "<<yytext<<endl; mline++;}

%%

int main()
{
yyin=fopen("myfile.txt","r");
yyout=fopen("yourfile.txt","w");
yylex();
cout<<"Total number of single line comment: "<<sline<<endl<<"Total number of multi line comment: "<<mline<<endl;
fclose(yyin);
fclose(yyout);
getchar();
return 0;
}
