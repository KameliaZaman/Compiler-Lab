%{
	#include<bits/stdc++.h>
	using namespace std;
	int yylex(void);
	void yyerror(char *);
%}

%token AND OR NOT TRUE FALSE

%% 
line:
      line bexpr '\n' { }
      | line '\n'
     |
     |error '\n' {yyerror("Reenter prev line"); yyerrok;}
     ;
bexpr: bexpr OR bterm { $$ = $1 + $3; } 
| bterm { $$ = $1;} 
; 
bterm: bterm AND bfactor { $$ = $1 & $3;} 
| bfactor { $$ = $1; } 
; 
bfactor: NOT bfactor { $$ = ! $2; } 
| '(' bexpr ')' { $$ = $2; } 
| TRUE { $$ = $1; } 
| FALSE {$$ = $1; } 
;

%%
void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
}

int main(void){
cout<<"Enter the Expression:"<<endl;
yyparse();
return 0;
}