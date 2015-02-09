grammar AssignmentStmt;
import CommonGrammar;
assign_main
 : (assign_stmt)* EOF
 ;
assign_stmt
 : Identifier '=' expression ';'
 ;
