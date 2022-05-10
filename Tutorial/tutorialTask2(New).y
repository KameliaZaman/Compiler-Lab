%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token CLASS EXTENDS PUBLIC IMPLEMENTS FINAL IDENTIFIER

%% 

line:
      line C '\n' {printf("Compilation Successful\n");}

      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;

C : P F CLASS IDENTIFIER X Y {}
	;

P : PUBLIC {}
	|
     ;

F : FINAL {}
	|
        ;
X : EXTENDS IDENTIFIER {}
	|
        ;

Y : IMPLEMENTS I {}
	|
        ;

I : IDENTIFIER J
	;

J : ',' I {}
	|
        ;

%%

void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}

int main(void)
{
printf("Enter the Expression:\n");
yyparse();
return 0;
}
