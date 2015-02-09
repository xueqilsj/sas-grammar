grammar DatalinesStmt;
import CommonGrammar;
datalines_main
 : (datalines_stmt | datalines4_stmt)* EOF
 ;
datalines_stmt
 : (DATALINES|CARDS) ';' ~(';')*? ';' 
 ;

datalines4_stmt
 : (DATALINES4|CARDS4) ';' .*? END_DATALINES4
 ;

