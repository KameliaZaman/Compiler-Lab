%option noyywrap

%{

#include<bits/stdc++.h>
using namespace std;
string key_string="";
string iden_string="";
string math_string="";
string rel_string="";
string logi_string="";
string num_string="";
string oth_string="";
int key=0,iden=0,math=0,rel=0,logi=0,num=0,oth=0;
void key_fun(string st);
void iden_fun(string st);
void math_fun(string st);
void rel_fun(string st);
void logi_fun(string st);
void num_fun(string st);
void oth_fun(string st);

%}

keyword "printf"|"scanf"|"auto"|"double"|"int"|"struct"|"break"|"else"|"long"|"switch"|"case"|"enum"|"register"|"typedef"|"char"|"extern"|"return"|"union"|"continue"|"for"|"signed"|"void"|"do"|"if"|"static"|"while"|"default"|"goto"|"sizeof"|"volatile"|"const"|"float"|"short"|"unsigned"
letter [a-zA-Z]
digit [0-9]
math_operator "+"|"-"|"*"|"/"|"%"|"++"|"--"|"="
relational_operator "=="|"!="|">"|"<"|">="|"<="
logical_operator "&&"|"||"|"!"
delim [ \t\n]
ws {delim}+

%%

{ws} ;
{keyword} {key++; key_fun(yytext);}
"_"*{letter}+{digit}* {iden++; iden_fun(yytext);}
{math_operator} {math++; math_fun(yytext);}
{relational_operator} {rel++; rel_fun(yytext);}
{logical_operator} {logi++; logi_fun(yytext);}
{digit}+"."*{digit}* {num++; num_fun(yytext);}
. {oth++; oth_fun(yytext);}

%%

int main()
{
yyin=fopen("input.txt", "r");
yyout=fopen("output.txt", "w");
yylex();
char* ara1=&key_string[0];
char* ara2=&iden_string[0];
char* ara3=&math_string[0];
char* ara4=&rel_string[0];
char* ara5=&logi_string[0];
char* ara6=&num_string[0];
char* ara7=&oth_string[0];
if(key!=0) fprintf(yyout,"Keywords: %s\n",ara1);
if(iden!=0) fprintf(yyout,"Identifiers: %s\n",ara2);
if(math!=0) fprintf(yyout,"Math Operators: %s\n",ara3);
if(rel!=0) fprintf(yyout,"Relational Operators: %s\n",ara4);
if(logi!=0) fprintf(yyout,"Logical Operators: %s\n",ara5);
if(num!=0) fprintf(yyout,"Numerical Values: %s\n",ara6);
if(oth!=0) fprintf(yyout,"Others: %s\n",ara7);
fclose(yyin);
fclose(yyout);
getchar();
return 0;
}

void key_fun(string st)
{
if(key>1) {if(key_string.find(st)==string::npos) key_string=key_string+", "+st;}
else if(key==1) key_string=key_string+st;
}

void iden_fun(string st)
{
if(iden>1) {if(iden_string.find(st)==string::npos) iden_string=iden_string+", "+st;}
else if(iden==1) iden_string=iden_string+st;
}

void math_fun(string st)
{
if(math>1) {if(math_string.find(st)==string::npos) math_string=math_string+", "+st;}
else if(math==1) math_string=math_string+st;
}

void rel_fun(string st)
{
if(rel>1) {if(rel_string.find(st)==string::npos) rel_string=rel_string+", "+st;}
else if(rel==1) rel_string=rel_string+st;
}

void logi_fun(string st)
{
if(logi>1) {if(logi_string.find(st)==string::npos) logi_string=logi_string+", "+st;}
else if(logi==1) logi_string=logi_string+st;
}

void num_fun(string st)
{
if(num>1) {if(num_string.find(st)==string::npos) num_string=num_string+", "+st;}
else if(num==1) num_string=num_string+st;
}

void oth_fun(string st)
{
if(oth>1) {if(oth_string.find(st)==string::npos) oth_string=oth_string+" "+st;}
else if(oth==1) oth_string=oth_string+st;
}
