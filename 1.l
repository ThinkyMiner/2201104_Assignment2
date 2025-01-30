%{
#include <stdio.h> 
%}
newLineCharacters [\r\n]
startMultiLineComment "/*"
startMultiLineComment2 "/**"
notStar [^*]
starPlusNotSlashOrNewline  \*+([^*/]|{newLineCharacters})
endMultiLineComment  \*+\/
multiLineComment {startMultiLineComment}({notStar}|{newLineCharacters}|{starPlusNotSlashOrNewline})*{endMultiLineComment}
documentationComment {startMultiLineComment2}({notStar}|{newLineCharacters}|{starPlusNotSlashOrNewline})*{endMultiLineComment}
words [a-zA-Z]+
others .|\n
spaces [\t ]+
singleLineComment "//".*
%%
{singleLineComment} ;
{documentationComment} printf("Comment: %s\n", yytext);
{multiLineComment} ;    
%%

int yywrap(void){} 

int main()
{
    yyin=fopen("SumOfTwoNumbers.java","r");
    yyout = fopen("SumOfTwoNumbers.txt", "w");
    yylex();
    return 0;
}
