grammar CallStmt;
import CommonGrammar;

call_main
 : (call_stmt)* EOF
 ;

call_stmt
 : CALL expression '(' expressionList? ')' ';'
 ;
