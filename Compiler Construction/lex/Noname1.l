%{
#include <stdio.h>
#include <stdlib.h>
enum tnumber { TEOF, TIDEN,TNUM,TASSIGN, TADD, TSEMI, TDOT, TBEGIN, TEND, tconst,
	       telse, tif, tint, treturn, tvoid, twhile, tequal, tnotequ, tlesse, tgreate,
	       tand, tor, tinc, tdec, taddAssign, tsubAssign, tmulAssign, tdivAssign, tmodAssign, TERROR};
%}
letter	[a-zA-Z_]
digit	[0-9]
%%
"const"	return(tconst);
"else" return (telse);
"if" return(tif);
"int" return(tint);
"return" return(treturn);
"void" return(tvoid);
"while" return(twhile);
"==" return(tequal);
"!=" return(tnotequ);
"<=" return(tlesse);
">=" return(tgreate);
"&&" return(tand);
"||" return(tor);
"++" return(tinc);
"--" return(tdec);
"+=" return(taddAssign);
"-=" return(tsubAssign);
"*=" return(tmulAssign);
"/=" return(tdivAssign);
"%=" reutnr(tmodAssign);
[A-Za-z_][A-Za-z0-9_]* return (TIDEN);
[1-9][0-9]*|0([0-7]+|(x|X)[0-9A-Fa-f]*)? return(TNUM);
"/*"([^*]|\*+[^*/])*\**"*/" ;
"//".* ;
[ \t\n] ;
. return (yytext[0]);
%%

void main()
{
	enum tnumber tn;
	printf("Start of Lex\n");
	while((tn=yylex()) != TEOF){
		switch(tn){
			case TBEGIN: printf("Begin\n"); break;
			case TEND: printf("End\n"); break;
			case TIDEN: printf("Identifier: %s\n", yytext); break;
			case TASSIGN: printf("Assignmdnt_op\n"); break;
			case TADD: printf("Add_op\n); break;
			case TNUM: printf("Number: %d\n", atoi(yytext)); break;
			case TSEMI: printf("Semicolon\n"); break;
			case TDOT: printf("Dot\n"); break;
			case tconst: printf("const\n"); break;
			case telse: printf("else\n"); break;
			case tif: printf("if\n"); break;
			case tint: printf("int\n"); break;
			case treturn: printf("return\n"); break;
			case tvoid: printf("void\n"); break;
			case twhile: printf("while\n"); break;
			case tequal: printf("equal == \n"); break;
			case tnotequ: printf("notequ != \n"; break;
			case tlesse: printf("lesse <= \n"); break;
			case tgreate: printf("greate >= \n"); break;
			case tand: printf("and && \n"); break;
			case tor: printf("or || \n"); break;
			case tinc: printf("inc ++ \n"); break;
			case tdec: printf("dec -- \n"); break;
			case taddAssign: printf("addAssign += \n"); break;
			case tsubAssign: printf("subAssign -= \n"); break;
			case tmulAssign: printf("mulAssign *= \n"); break;
			case tdivAssign: printf("divAssign /= \n"); break;
			case tmodAssign: printf("modAssign %= \n"); break;
		}
	}
}

int yywrap()
{
printf("End of Lex\n");
return 1;
}