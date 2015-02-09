lexer grammar DatalinesLexer;

DATALINES : D A T A L I N E S ';'	-> pushMode(DATALINES_MODE) ;
CARDS : C A R D S ';'				-> pushMode(DATALINES_MODE) ;
DATALINES4 : D A T A L I N E S Four	';'-> pushMode(DATALINES_MODE);
CARDS4 : C A R D S Four	';'			-> pushMode(DATALINES_MODE);
 
fragment Four: '4' ;
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

WS  :   [ \r\t\u000C\n]+ -> skip;
COMMENT    :   '/*' .*? '*/'    -> skip;
LINE_COMMENT    :   '*' ~[\r\n]* -> skip;

mode DATALINES_MODE;
SEMICOLON : ';' -> mode(DEFAULT_MODE) ;
END_DATALINES4 : ';;;;' -> mode(DEFAULT_MODE);
DATALINE : ~(';')*? ('\r'|'\n') ;
DATALINE4 : .*? ('\r'|'\n') ;
TEXT : . ;
