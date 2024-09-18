
/*Emir Senel 20190702062*/

movenum	[1-9]
column	[a-h]
row	[1-8]

%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
int linenum=1;
%}

%%
{movenum}+ {yylval.str = strdup(yytext);return MOVENUM;}
{column}{row} {yylval.str=strdup(yytext);return PLACE;}
K return KING;
Q return QUEEN;
R return ROOK;
B return BISHOP;
N return KNIGHT;
x return CAPTURES;
\- return MOVES;
\+ return CHECK;
\# return CHECKMATE;
\. return DOT;
O-O return CASTLESKINGSIDE;
O-O-O return CASTLESQUEENSIDE;
\n	linenum++;
[ \t]+
%%