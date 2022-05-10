%option noyywrap
%{
	#include<iostream>
	#include <set>
	#include <iterator>
	using namespace std;
	set<string> Keywords,Identifiers;

%}
letter [a-zA-Z]
digit [0-9]
keywords "class"|"extends"|"public"|"implements"|"final"|","
%%
{keywords} {Keywords.insert(yytext);}
{letter}({letter}|{digit})* {Identifiers.insert(yytext);}
. ;

%%
int main()
{     
      FILE *myfile= fopen("C:\\Users\\kamel\\Desktop\\Practice\\Yacc Assignment\\input.txt","r");

      if(!myfile)
      {
		cout<<"I can not open input.txt file"<<endl;
      }
      else
      {
	       yyin = myfile;

	      yylex();
	      fclose(myfile);
	      set<string >::iterator itr;

	      cout<<"Keywords:";
	      for(itr=Keywords.begin(); itr!=Keywords.end(); itr++)
	      {
		cout<<*itr<<" ,";
	      }
	      cout<<endl;

	      cout<<"Identifier:";
	      for(itr=Identifiers.begin(); itr!=Identifiers.end(); itr++)
	      {
		  cout<<*itr<<" ,";
	      }
	      cout<<endl;
	      
	}


       getchar();

	return 0;
}
