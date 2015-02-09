grammar RunStmt;
import CommonGrammar;
run_main
 : (run_stmt)* EOF
 ;
run_stmt
 : RUN CANCEL? ';'
 ;
