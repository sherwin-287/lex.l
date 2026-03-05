%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int line_no = 1;
%}


DIGIT      [0-9]
LETTER     [a-zA-Z_]
IDENT      {LETTER}({LETTER}|{DIGIT})*
INT_CONST  {DIGIT}+
FLOAT_CONST {DIGIT}+"."{DIGIT}+

%%
"int"      { printf("Keyword : int\n"); }
"float"    { printf("Keyword : float\n"); }
"if"       { printf("Keyword : if\n"); }
"else"     { printf("Keyword : else\n"); }
"while"    { printf("Keyword : while\n"); }
"print"    { printf("Keyword : print\n"); }


"&&"       { printf("Logical Operator : AND\n"); }
"||"       { printf("Logical Operator : OR\n"); }
"!"        { printf("Logical Operator : NOT\n"); }


"<="       { printf("Relational Operator : <=\n"); }
">="       { printf("Relational Operator : >=\n"); }
"=="       { printf("Relational Operator : ==\n"); }
"!="       { printf("Relational Operator : !=\n"); }
"<"        { printf("Relational Operator : <\n"); }
">"        { printf("Relational Operator : >\n"); }

/* Arithmetic Operators */
"+"        { printf("Arithmetic Operator : +\n"); }
"-"        { printf("Arithmetic Operator : -\n"); }
"*"        { printf("Arithmetic Operator : *\n"); }
"/"        { printf("Arithmetic Operator : /\n"); }
"%"        { printf("Arithmetic Operator : %%\n"); }


";"        { printf("Delimiter : ;\n"); }
"{"        { printf("Left Bracekets : {\n"); }
"}"        { printf("Right Bracekets : }\n"); }
"("        { printf("Left Parenthesis : (\n"); }
")"        { printf("Right Parenthesis : )\n"); }


{FLOAT_CONST} { printf("Float Constant (%s)\n", yytext); }
{INT_CONST}   { printf("Integer Constant (%s)\n", yytext); }

{IDENT}    { printf("Identifier (%s)\n", yytext); }


[ \t]+  {/* ignore whitespace */}
\n   {line_no++; }


.{ printf("Lexical Error at line %d : %s\n", line_no, yytext); }

%%

int main()
{
    printf("Lexical Analysis Start.\n\n");
    yylex();
    printf("\nLexical Analysis Complete.\n");
    return 0;
}
