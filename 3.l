%{
#include <stdio.h>
int html=0;
int script=0;
int pc = 0;
int head = 0;
int title = 0;
int body = 0;
int divc = 0;
int span = 0;
%}

HTML \<html\>|\<\/html\>
P \<p\>|\<\/p\>
HEAD \<head\>|\<\/head\>
TITLE \<title\>|\<\/title\>
BODY \<body\>|\<\/body\>
DIV \<div\>|\<\/div\>
SPAN \<span\>|\<\/span\>
SCRIPT \<script\>|\<\/script\>
words [a-zA-Z]+
others .|\n
spaces [\t ]+

%%
[\t ]+ ;
{HTML} { html++; }
{P} { pc++; }
{HEAD} { head++; }
{TITLE} { title++; }
{BODY} { body++; }
{DIV} { divc++; }
{SPAN} { span++; }
{SCRIPT} { script++; }
{words}	;										  /* Ignore other characters */
{others} ;
%%

int yywrap(void) { return 1; }

int main()
{
    yylex();
    printf("HTML tags: %d\n", html);
    printf("Script tags: %d\n", script);
    printf("Paragraph tags: %d\n", pc);
    printf("Head tags: %d\n", head);
    printf("Title tags: %d\n", title);
    printf("Body tags: %d\n", body);
    printf("Div tags: %d\n", divc);
    printf("Span tags: %d\n", span);
    return 0;
}