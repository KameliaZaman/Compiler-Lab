%{
#include <stdio.h>
void yyerror(char *);
%}
%token whitespace keyword identifier

%%
line:
      line stmt '\n' {  }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;

stmt : C             {printf("Compilation Successful\n");}

C : P F 'class' 'identifier' X Y{$$ = $1 $2 class identifier $3 $4;};

P : 'public' {$$ = public;}
     |
     ;

F : 'final' {$$ = final;}
        |
        ;
X : 'extends' 'identifier' {$$ = extends identifier;}
        |
        ;

Y : 'implements' I {$$ = implements $5;}
        |
        ;

I : 'identifier' J {$$ = identifier $6;}        ;

J : ',' I {$$ = , $5;}
        |
        ;

%%
void yyerror(char *s) {
printf("%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
