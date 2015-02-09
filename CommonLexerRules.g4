lexer grammar CommonLexerRules; // note "lexer grammar"

// TODO: make it case insensitive
// abort

ABORT : 'abort' ;
ABEND  : 'abend' ;
CANCEL : 'cancel' ;
FILE   : 'file' ;
RETURN : 'return' ;
NOLIST : 'nolist' ;

//array
ARRAY : 'array' ;
ARRAY_NUMERIC_ELEMENTS : '_NUMERIC_' ;
ARRAY_CHARACTER_ELEMENTS : '_CHARACTER_' ;
ARRAY_ALL_ELEMENTS : '_ALL_' ; 

// by
BY : 'by' ;
GROUPFORMAT : 'groupformat' ;
NOTSORTED : 'notsorted' ;
DESCENDING : 'descending' ;
// call 
CALL : 'call' ;
// datalines
DATALINES : 'datalines' ;
CARDS : 'cards' ;
LINES : 'lines' ;
DATALINES4 : 'datalines4' ;
CARDS4 : 'cards4' ;
LINES4 : 'lines4' ;
END_DATALINES4 : ';;;;' ;

// infile
INFILE : 'infile' ; 
DISK :  D I S K; 
DUMMY :  D U M M Y ; 
GTERM : G T E R M ;
PIPE : P I P E ;
PLOTTER : P L O T T E R ;
PRINTER : P R I N T E R ;
TAPE : T A P E ;
TEMP : T E M P ;
TERMINAL : T E R M I N A L ;
UPRINTER : U P R I N T E R ;
DSD : D S D ;
EXPANDTABS : E X P A N D T A B S ;
NOEXPANDTABS : N O E X P A N D T A B S;
FLOWOVER : F L O W O V E R ;
MISSOVER : M I S S O V E R;
PAD : P A D ;
NOPAD : N O P A D ;
SCANOVER : S C A N O V E R ;
SHAREBUFFERS : S H A R E B U F F E R S;
STOPOVER : S T O P O V E R;
TRUNCOVER : T R U N C O V E R;
V_INFILE_ : '_' I N F I L E '_' ;
SEMICOLON : ';' ;

// ahead of Identifier, in case, eq is recognized as identifier
OF : O F ;
EQ : E Q | '==' ;
NE : N E | '^=' | '~=';
GT : G T | '>' ;
LT : L T | '<' ;
GE : G E | '>='; 
LE : L E | '<=';
IN : I N;
EQC : EQ ':' ;
NEC : NE ':' ;
GTC : GT ':' ;
LTC : LT ':' ;
GEC : GE ':' ;
LEC : LE ':' ;
INC : IN ':' ;
AND : A N D | '&' ;
OR : O R | '|' | '!' ;
NOT : N O T | '^' | '~' ;
MIN : '><';
MAX : '<>';

// NOTE: date, time or bit literals must go ahead of Identifier 
// in case '01jan04'd being recognized as string + Identifier
DateLiteral: STRINGLITERAL D;
TimeLiteral: STRINGLITERAL T;
DateTimeLiteral: STRINGLITERAL D T;
BitLiteral: STRINGLITERAL B;
NameLiteral: STRINGLITERAL N;
HexLiteral: STRINGLITERAL X;

STRINGLITERAL
    :   '"' ( ESC | ~[\\"] )* '"'
    |   '\'' ( ESC | ~[\\'] )* '\''
    ;
fragment ESC :   '\\' [abtnfrv"'\\]    ;
INT : [0-9]+ ; 
MissingValueLiteral : '.' ;
FloatingPointLiteral 
 : [0-9]* ('.')? [0-9]+ ([eE][-+]?[0-9]+)?
 | INT '.'
 ;
Identifier
 : [a-zA-Z_] [a-zA-Z_0-9]*
 // place all the keywords here to resolve "keywords can also be identifiers" problem   
 ;

EQUAL : '=' ; //  '==' matches EQ
COLON : ':' ;
COMMA : ',' ;
DOLLAR : '$' ;
PERCENT : '%' ;
ADD : '+' ;
SUB : '-' ;
MUL : '*' ;
DIV : '/' ;
VERLINE : '|' ;
EXCLAMATION : '!' ;
LParentheses : '(' ;
RParentheses : ')' ;
LBraces : '{' ;
RBraces : '}' ;
LSqBracket : '[' ;
RSqBracket : ']' ;
LBracket : LParentheses | LSqBracket | LBraces ;
RBracket : RParentheses | RSqBracket | RBraces ; 

WS  :   [ \r\t\u000C\n]+ -> skip    ;
COMMENT    :   '/*' .*? '*/'    -> skip    ;

fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
