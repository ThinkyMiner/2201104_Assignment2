%{
#include <stdio.h> 
%}

newLineCharacters [\r\n]
singleLineComment "//".*
startMultiLineComment "/**"
notStar [^*]
starPlusNotSlashOrNewline  \*+([^*/]|{newLineCharacters})
endMultiLineComment  \*+\/
multiLineComment {startMultiLineComment}({notStar}|{newLineCharacters}|{starPlusNotSlashOrNewline})*{endMultiLineComment}
words [a-zA-Z]+
others .|\n
spaces [\t ]+

%%
{singleLineComment} ;
{multiLineComment} fprintf(yyout, "Comment: %s\n", yytext);
{words}	;
{others} ;
{spaces} ;
%%

int yywrap(void){} 

int main()
{
    yyin = fopen("SumOfTwoNumbers.java","r");
    // yyout = fopen("SumOfTwoNumbers.txt", "w");
    yylex();
    return 0;
}
