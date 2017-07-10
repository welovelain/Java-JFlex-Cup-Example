import java_cup.runtime.*;
      
%%

%class Lexer

%line
%column

%cup

%{  
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

NUM = [0-9]+
IDENT = [A-Za-z_][A-Za-z_0-9]*
STRING = \"([^\\\"]|\\.)*\"

%%
   
<YYINITIAL> {

    /** Keywords. */
    "and"             { return symbol(sym.AND); }
    "or"              { return symbol(sym.OR); }
    "not"             { return symbol(sym.NOT); }
    "true"            { return symbol(sym.TRUE); }
    "false"           { return symbol(sym.FALSE); }

    "begin"           { return symbol(sym.BEGIN); }
    "end"             { return symbol(sym.END); }
    "exit"            { return symbol(sym.EXIT); }
    "if"              { return symbol(sym.IF); }
    "then"            { return symbol(sym.THEN); }
    "else"            { return symbol(sym.ELSE); }
    "while"           { return symbol(sym.WHILE); }
    "do"              { return symbol(sym.DO); }

    "print"           { return symbol(sym.PRINT); }
    "readint"         { return symbol(sym.READINT); }
    "length"          { return symbol(sym.LENGTH); }
    "position"        { return symbol(sym.POSITION); }
    "readstr"         { return symbol(sym.READSTR); }
    "concatenate"     { return symbol(sym.CONCATENATE); }
    "substring"       { return symbol(sym.SUBSTRING); }

    ":="              {return symbol(sym.ASSIGN); }
    "="               { return symbol(sym.EQ); }
    "<"               { return symbol(sym.LT); }
    "<="              { return symbol(sym.LE); }
    ">"               { return symbol(sym.GT); }
    ">="              { return symbol(sym.GE); }
    "<>"              { return symbol(sym.NE); }

    "=="              { return symbol(sym.STREQ); }
    "!="              { return symbol(sym.STRNOTEQ); }

    ";"                { return symbol(sym.SEMI); }
    ","                { return symbol(sym.COMMA); }
    "("                { return symbol(sym.LPAREN); }
    ")"                { return symbol(sym.RPAREN); }
    "+"                { return symbol(sym.PLUS); }
    "-"                { return symbol(sym.MINUS); }
    "*"                { return symbol(sym.TIMES); }
    "%"                { return symbol(sym.MODE);  }
    "/"                { return symbol(sym.DIVIDE); }
   
    {NUM}      { return symbol(sym.NUM, new Integer(yytext())); }
    {IDENT}       { return symbol(sym.IDENT, new String(yytext()));}
    {STRING}      { return symbol(sym.STRING, new String(yytext())); }

    {WhiteSpace}       { /* do nothing */ }   
    <<EOF>> { return symbol(sym.EOF); }
}


/* error */ 
[^]                    { throw new Error("Illegal character <"+yytext()+">"); }
