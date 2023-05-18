%{
#include "parser.tab.h"
extern void yyerror(const char *);
%}
%option noyywrap
%option yylineno
%%

[ \t\n]                  { /* ignore whitespace */ }

"create"|"CREATE"        { return CREATE; }
"alter"|"ALTER"          { return ALTER; }
"drop"|"DROP"            { return DROP; }
"select"|"SELECT"        { return SELECT; }
"delete"|"DELETE"        { return DELETE; }
"insert"|"INSERT"        { return INSERT; }
"update"|"UPDATE"        { return UPDATE; }
"where"|"WHERE"          { return WHERE; }
"into"|"INTO"            { return INTO; }
"from"|"FROM"            { return FROM; }
"set"|"SET"              { return SET; }
"values"|"VALUES"              { return VALUES; }
"INT"     {return INT;}
"FLOAT"     {return FLOAT;}
"VARCHAR"     {return VARCHAR;}
"BOOLEAN"     {return BOOLEAN;}

[a-zA-Z][a-zA-Z0-9_]*    { return ID; }
[0-9]+                   { return INTEGER; }
"."                      { return DOT; }
","                      { return COMMA; }
";"                      { return SEMICOLON; }
"*"                      { return ASTERISK; }
"="                      { return EQ; }
">"                      { return GT; }
"<"                      { return LT; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }

%%
