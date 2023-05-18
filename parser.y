%{
#include <stdio.h>
extern int yylex();

void yyerror(const char *s) { printf("Error: %s\n", s); }
extern FILE* yyin;
%}


%start stmt_list
%token ID
%token INTEGER
%token CREATE ALTER DROP SELECT DELETE INSERT UPDATE WHERE INTO FROM SET VALUES INT FLOAT VARCHAR BOOLEAN
%token DOT COMMA SEMICOLON ASTERISK EQ GT LT LPAREN RPAREN

%%

stmt_list:
  /* empty */
  | stmt_list stmt
  ;

stmt:
  create_stmt
  | alter_stmt
  | drop_stmt
  | select_stmt
  | delete_stmt
  | insert_stmt
  | update_stmt
  ;

create_stmt:
  CREATE ID LPAREN id_list RPAREN SEMICOLON {printf("CREATE STATEMENT PARSED\n");}
  ;

alter_stmt:
  ALTER ID SEMICOLON {printf("ALTER STATEMENT PARSED\n");}
  ;

drop_stmt:
  DROP ID SEMICOLON {printf("DROP STATEMENT PARSED\n");}
  ;

select_stmt:
  SELECT select_expr FROM ID where_clause SEMICOLON {printf("SELCT STATEMENT PARSED\n");}
  ;

delete_stmt:
  DELETE FROM ID where_clause SEMICOLON {printf("DELETE STATEMENT PARSED\n");}
  ;

insert_stmt:
  INSERT INTO ID LPAREN id_list RPAREN VALUES LPAREN value_list RPAREN SEMICOLON {printf("INSERT STATEMENT PARSED\n");}
  ;

update_stmt:
  UPDATE ID SET ID EQ INTEGER where_clause SEMICOLON {printf("UPDATE STATEMENT PARSED\n");}
  ;

select_expr:
  ASTERISK
  | id_list
  ;

where_clause:
  /* empty */
  | WHERE ID EQ INTEGER
  ;

id_list:
  id_definition
  | id_definition COMMA id_list
  ;

id_definition:
     ID data_type
     | ID
                  ;

data_type:
          INT
          | FLOAT
          | VARCHAR
          | BOOLEAN
          ;


value_list:
  INTEGER
  | value_list COMMA INTEGER
  ;

%%


int main(int argc, char *argv[]) {
  if (argc ==2)
  {
    yyin = fopen(argv [1], "r");
  }
  yyparse();
  return 0;
}
