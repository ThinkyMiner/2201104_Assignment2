%{
#include <stdio.h> 
%}
singleLineComment "//".*
%%
{singleLineComment}
%%

int yywrap(void){} 

int main()
{
    yyin=fopen("SumOfTwoNumbers.java","r");
    yyout = fopen("SumOfTwoNumbers.txt", "w");
    yylex();
    return 0;
}
