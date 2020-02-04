%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
	#include<string.h>
	#include<stdbool.h>
	#include<ctype.h>
	#include<limits.h>
%}

%%
[\t\n]								;
int|char|return|read|write|writeln|break|if|else|while     	return TOKEN_Keyword;
[a-zA-Z_][a-zA-Z0-9_]*                                  	{SAVE_TOKEN; return TOKEN_Identifier;}
[0-9]*								{SAVE_TOEKN; return TOKEN_Integer;}
[0-9]*[.0-9]+							{SAVE_TOKEN; return TOKEN_Double;}
"!"                                 				return TOKEN_Uop_NOT;
"+"   								return TOKEN_Bop_PLUS;
"-"                                                         	return TOKEN_Bop_MINUS;
"*"								return TOKEN_Bop_MUL;
"/"								return TOKEN_Bop_DIV;
"=="								return TOKEN_Bop_EQ;
"!="								return TOKEN_Bop_NEQ;
"<"								return TOKEN_Bop_LT;
"<="								return TOKEN_Bop_LE;
">"								return TOKEN_Bop_GT;
">="								return TOKEN_Bop_GE;
"|"								return TOKEN_Bop_OR;
"&&"								return TOKEN_Bop_AND;
"]"								return TOKEN_BRACE_RSQ;
"["								return TOKEN_BRACE_LSQ;
"}"								return TOKEN_BRACE_RCUR;
"{"								return TOKEN_BRACE_LCUR;
")"								return TOKEN_BRACE_RCUV;
"("								return TOKEN_BRACE_LCUV;
";"								return TOKEN_End_Delimeter;
%%

int main(){
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}
