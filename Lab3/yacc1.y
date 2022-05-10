%{
#include<bits/stdc++.h>
using namespace std;
int yylex(void);
void yyerror(char *);
int symbol[26];
%}
%token INTEGER LETTER
%left '+' '-'
%left '*' '/'
%right UnaryMinus 

%%
line:
      line stmt '\n' { }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;

stmt : expr             { cout<<"Compilation Successful"<<endl; cout<<"The Result: "<<$1<<endl; }
       | LETTER '=' expr  { symbol[$1] = $3; }
expr:
	INTEGER { $$ = $1; }
	| LETTER { $$ = symbol[$1];  }
	| expr '+' expr { $$ = $1 + $3; }
	| expr '-' expr { $$ = $1 - $3; } 
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr                             { 
					if($3==0)
						yyerror("divide 0 error!!"); 
					else
						$$ = $1 / $3;
					}

	| '(' expr ')' { $$ = $2; }
	|'-' expr %prec UnaryMinus {$$ = - $2;}
	;
%%
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}

int main(void)
{
cout<<"Enter the Expression:"<<endl;
yyparse();
return 0;
}
