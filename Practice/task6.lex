%option noyywrap
%{
	#include<stdio.h>
int sline=0,mline=0;

%}

%%

"//".*"\n" {printf("Single line comment found.\n "); sline++;}
"/*".*"\n"*.*"*/" {printf("Multi line comment found.\n "); mline++;}

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