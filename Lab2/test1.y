%{
	#include<stdio.h>
	int yylex(void);
	void yyerror(char *);
%}

%token INTEGER
%left '+' '-' /* left associativity */
%left '*' '/' /* precedence increases downwards */
%right UnaryMinus 

%% 
/*Rules*/

line: 
	line expr '\n' {printf("%d\n",$2);}
	|line '\n'
	|
	|error '\n' {yyerror("Re enter previous line"); yyerrok; /*for wrong input*/ }
	;
 /* $$ $1   $2  $3  */
expr: 
	expr '+' expr {$$ = $1 + $3;}
	|expr '-' expr {$$ = $1 - $3;}
	|expr '*' expr {$$ = $1 * $3;}
	|expr '/' expr {if($3 ==0)
			   yyerror("divide 0 error!!");
			else
			   $$ = $1 / $3;
			}
	|'(' expr ')' {$$ = $2;}
	|'-' expr %prec UnaryMinus {$$ = -$2;} /* 2(-5) */
	|INTEGER {$$ = $1;}
	;

%%
/*Subroutines*/
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}

int main(void)
{
yyparse();
return 0;
}
/*yacc bottom up LALR parser */