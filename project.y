
/*Emir Senel 20190702062*/

%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	extern int linenum;
	void yyerror(string s);
	bool errorFlag=false;
%}

%union
{
	char * str;
}

%token <str> MOVENUM PLACE
%token KING QUEEN ROOK BISHOP KNIGHT CAPTURES MOVES CHECK CHECKMATE DOT CASTLESKINGSIDE CASTLESQUEENSIDE


%%

lines:
	line lines
	|
	line
	;

line:
	MOVENUM {cout<<"move "<<$1<<endl;} DOT {cout<<"The white ";} move_line {cout<<"The black ";} move_line
	;
	
move_line:
	piece PLACE {cout<<"on "<<$2;} CAPTURES {cout<<" takes the ";} piece PLACE {cout<<"on "<<$7<<". ";} checkstatus
	|
	piece PLACE {cout<<"on "<<$2;} MOVES {cout<<" moves to ";} PLACE {cout<<$6<<". ";} checkstatus
	|
	castles checkstatus
	;
	
castles:
	CASTLESKINGSIDE {cout<<"is castling to King's side. ";}
	|
	CASTLESQUEENSIDE {cout<<"is castling to Queen's side. ";}
	;

piece:
	KING {cout<<"king ";}
	|
	QUEEN {cout<<"queen ";}
	|
	ROOK {cout<<"rook ";}
	|
	BISHOP {cout<<"bishop ";}
	|
	KNIGHT {cout<<"knight ";}
	|
	    {cout<<"pawn ";}
	;

checkstatus:
	CHECK {cout<<"Check."<<endl;}
	|
	CHECKMATE {cout<<"Checkmate!"<<endl;}
	|
			{cout<<endl;}
	;

%%
void yyerror(string s){
	errorFlag=true;
	cerr<<"Error at line: "<<linenum<<endl;
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
	//if(errorFlag==false){cout<<"Syntax correct."<<endl;}
    return 0;
}