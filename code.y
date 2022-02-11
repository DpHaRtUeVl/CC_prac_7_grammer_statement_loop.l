%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ID NUM SWITCH CASE DEFAULT BREAK LE GE EQ NE OR AND ELSE FOR
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%
S : ST {printf("Input accepted.\n");exit(0);}
| ST1 {printf("Input accepted.\n");exit(0);}
;
ST : SWITCH '(' ID ')' '{' B '}'
;
ST1 : FOR '(' E ';' E2 ';' E ')' '{' ST2 ';' '}'
;
ST2 : ST1
| E
;
B : C
| C D
;
C : C C
| CASE NUM ':' E ';'
| BREAK ';'
;
D : DEFAULT ':' E ';' BREAK ';'
;
E : ID'='E
| E'+'E
| E'-'E
| E'*'E
| E'/'E
| E'<'E
| E'>'E
| E LE E
| E GE E
| E EQ E
| E NE E
| E OR E
| E AND E
| ID
| NUM
;
E2 : E2'<'E2
| E2'>'E2
| E2 LE E2
| E2 GE E2
| E2 EQ E2
| E2 NE E2
| E2 OR E2
| E2 AND E2
| ID
| NUM
;
%%
main()
{
printf("Enter the exp: ");
yyparse();
}
yyerror(s)
char *s;
{
fprintf(stderr, "%s\n",s);
}
yywrap()
{
return(1);
}
