 /*
  * filename lex.l
  * Copyright (c) 2017 Copyright Holder All Rights Reserved.
  * flex lex.l
  */
 /*大小写不敏感*/
%option case-insensitive
%{
#include<stdio.h>
#include<string.h>
%}
 /*排他性起始声明*/
%X COMMENT

%%

 /*KEYWORDS*/
CREATE { printf("get %s\n",yytext);}
DATABASE { printf("get %s\n",yytext); }
DATABASES { printf("get %s\n",yytext); }
SHOW { printf("get %s\n",yytext); }
USE { printf("get %s\n",yytext); }
TABLE { printf("get %s\n",yytext); }
TABLES { printf("get %s\n",yytext); }
DROP { printf("get %s\n",yytext); }
INSERT { printf("get %s\n",yytext); }
INTO { printf("get %s\n",yytext);}
VALUES { printf("get %s\n",yytext); }
SELECT { printf("get %s\n",yytext); }
FROM { printf("get %s\n",yytext);}
WHERE { printf("get %s\n",yytext); }
AND { printf("get %s\n",yytext); }
OR { printf("get %s\n",yytext); }
DELETE { printf("get %s\n",yytext); }
UPDATE { printf("get %s\n",yytext); }
SET { printf("get %s\n",yytext); }
INT { printf("get %s\n",yytext); }
CHAR { printf("get %s\n",yytext); }
EXIT { yyterminate(); }

 /*NUMBER*/
-?[0-9]+                       {printf("get %s\n",yytext);}
-?[0-9]+"."[0-9]* |
-?[0-9]+E[-+]?[0-9]+ |
-?[0-9]+"."[0-9]*E[-+]?[0-9]+  { printf("get %s\n",yytext);}


 /*strings*/
'(\\.|''|[^'\n])*'  {printf("get %s\n",yytext);}
 /*NAME*/
[A-Za-z][A-Za-z0-9_]* {printf("get %s\n",yytext);}

 /*OPERATORS*/
[-+*/(),.;] {printf("get %s\n",yytext); }
"="     { printf("get %s\n",yytext); }
"!="    { printf("get %s\n",yytext); }
"<"     { printf("get %s\n",yytext); }
">"     { printf("get %s\n",yytext); }
"<="    { printf("get %s\n",yytext); }
">="    { printf("get %s\n",yytext); }

 /*COMMENT*/
"/*"     {BEGIN COMMENT;printf("comment");}
<COMMENT>"*/" {BEGIN INITIAL;printf("exit comment");};
<COMMENT>.|\n ;
<COMMENT><<EOF>> { printf("unclosed comment"); }

[ \t\n]  /*white space*/
.       { printf("Line %d:unknow word %s\n",yylineno,yytext); }
%%
main(int argc, char **argv)
{
	while(1) {
		yylex();
	}
}
