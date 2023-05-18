%option noyywrap
%option yylineno
%%
SELECT      { fprintf(yyout, "SELECT,%d\n",yylineno); }
FROM        { fprintf(yyout, "FROM,%d\n",yylineno); }
WHERE       { fprintf(yyout, "WHERE,%d\n",yylineno); }
INSERT      { fprintf(yyout, "INSERT,%d\n",yylineno); }
INTO        { fprintf(yyout, "INTO,%d\n",yylineno); }
VALUES      { fprintf(yyout, "VALUES,%d\n",yylineno); }
UPDATE      { fprintf(yyout, "UPDATE,%d\n",yylineno); }
DELETE      { fprintf(yyout, "DELETE,%d\n",yylineno); }
CREATE      { fprintf(yyout, "CREATE,%d\n",yylineno); }
ALTER       { fprintf(yyout, "ALTER,%d\n",yylineno); }
TABLE       { fprintf(yyout, "TABLE,%d\n",yylineno); }
DROP        { fprintf(yyout, "DROP,%d\n",yylineno); }
INDEX       { fprintf(yyout, "INDEX,%d\n",yylineno); }
VIEW        { fprintf(yyout, "VIEW,%d\n",yylineno); }
TRUNCATE    { fprintf(yyout, "TRUNCATE,%d\n",yylineno); }
SET         { fprintf(yyout, "SET,%d\n",yylineno); }
JOIN        { fprintf(yyout, "JOIN,%d\n",yylineno); }
ON          { fprintf(yyout, "ON,%d\n",yylineno); }
GROUP       { fprintf(yyout, "GROUP,%d\n",yylineno); }
BY          { fprintf(yyout, "BY,%d\n",yylineno); }
ORDER       { fprintf(yyout, "ORDER,%d\n",yylineno); }
BY          { fprintf(yyout, "BY,%d\n",yylineno); }
ASC         { fprintf(yyout, "ASC,%d\n",yylineno); }
DESC        { fprintf(yyout, "DESC,%d\n",yylineno); }
AND         { fprintf(yyout, "AND,%d\n",yylineno); }
OR          { fprintf(yyout, "OR,%d\n",yylineno); }
NOT         { fprintf(yyout, "NOT,%d\n",yylineno); }
NULL        { fprintf(yyout, "NULL,%d\n",yylineno); }
LIKE        { fprintf(yyout, "LIKE,%d\n",yylineno); }
IN          { fprintf(yyout, "IN,%d\n",yylineno); }
BETWEEN     { fprintf(yyout, "BETWEEN,%d\n",yylineno); }
IS          { fprintf(yyout, "IS,%d\n",yylineno); }
TRUE        { fprintf(yyout, "TRUE,%d\n",yylineno); }
FALSE       { fprintf(yyout, "FALSE,%d\n",yylineno); }

";"         { fprintf(yyout, "Semicolon,%d\n",yylineno);}
\*          { fprintf(yyout, "Operator,%d\n",yylineno); }
\+          { fprintf(yyout, "Operator,%d\n",yylineno); }
\-          { fprintf(yyout, "Operator,%d\n",yylineno); }
\>          { fprintf(yyout, "Operator,%d\n",yylineno); }
\<          { fprintf(yyout, "Operator,%d\n",yylineno); }
\=          { fprintf(yyout, "Operator,%d\n",yylineno); }

[+-]?[0-9]+(\.[0-9]*)?   { fprintf(yyout, "Identifier,%d\n",yylineno); }
'[^']*'|\"[^"]*\"        { fprintf(yyout, "String,%d\n",yylineno); }
[[:space:]]+    ; /* Skip whitespace */
.       ; /* Ignore any other characters */

%%

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: ./scanner input.txt\n");
        return 1;
    }

    FILE* inFile = fopen(argv[1], "r");
    if (!inFile) {
        printf("Failed to open input file.\n");
        return 1;
    }

    FILE* outFile = fopen("output.txt", "w");
    if (!outFile) {
        printf("Failed to open output file.\n");
        return 1;
    }

    yyin = inFile;
    yyout = outFile;

    yylex();

    fclose(inFile);
    fclose(outFile);

    printf("Tokens generated successfully.\n");

    return 0;
}
