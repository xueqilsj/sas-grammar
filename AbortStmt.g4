grammar AbortStmt;

import CommonLexerRules;

abort_main
 : (abort_stmt)* EOF
 ;
abort_stmt
 : ABORT (ABEND | CANCEL (file_spec)? | RETURN )? INT? NOLIST? ';';
 
file_spec: STRINGLITERAL ;


