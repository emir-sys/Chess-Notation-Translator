#define MOVENUM 257
#define PLACE 258
#define KING 259
#define QUEEN 260
#define ROOK 261
#define BISHOP 262
#define KNIGHT 263
#define CAPTURES 264
#define MOVES 265
#define CHECK 266
#define CHECKMATE 267
#define DOT 268
#define CASTLESKINGSIDE 269
#define CASTLESQUEENSIDE 270
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union
{
	char * str;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;
