grammar ByStmt;
import CommonGrammar;

by_main
 : (by_stmt)* EOF
 ;
by_stmt
 : BY (DESCENDING? Identifier) (DESCENDING? Identifier)* NOTSORTED? GROUPFORMAT? ';'
 ;
