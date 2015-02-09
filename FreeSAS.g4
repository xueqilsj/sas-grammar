grammar FreeSAS;
import CommonGrammar, AbortStmt, ProcStmt, ArrayStmt, AssignmentStmt, 
	ByStmt, CallStmt, DataStmt, DatalinesStmt, DropStmt, InfileStmt, InputStmt, MeansProc,
	RunStmt;

parse
 : (sas_stmt_list)* EOF
 ;

sas_stmt_list
 : abort_stmt
 | array_stmt
 | by_stmt
 | call_stmt
 | datalines_stmt
 | datalines4_stmt
 | delete_stmt
 | drop_stmt
 | data_stmt
 | if_stmt
 | if_then_else_stmt
 | infile_stmt
 | input_stmt
 | put_stmt
 | means_proc
 | proc_stmt
 // assign must go last
 | assign_stmt
 | run_stmt
 ;
 
if_stmt 
 : IF expression ';'
 ;

if_then_else_stmt
 : IF expression THEN sas_stmt_list (ELSE sas_stmt_list)? 
 ;
 
delete_stmt : DELETE ';' ;
