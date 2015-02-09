grammar DataStmt;
import CommonGrammar ;

data_main
 : (data_stmt)* EOF
 ;

data_stmt
 : DATA ';'
 | DATA Tk_NULL datastmt_cmd? NOLIST? ';' 
 | DATA dataset_name_opt+ datastmt_cmd? NOLIST? ';'
 | DATA view_dsname_opt+ '/' VIEW '=' view_name passwd_opt? source_opt? NESTING? NOLIST? ';'
 | DATA dataset_name '/' PGM '=' program_name passwd_opt? source_opt? NESTING? NOLIST? ';'
 | DATA VIEW '=' view_name passwd_opt? NOLIST? ';'
 | DATA PGM '=' program_name passwd_opt? NOLIST? ';'
 ;
// DATA <data-set-name-1 <(data-set-options-1)>> 
// DATA view-name <data-set-name-1 <(data-set-options-1)>>
dataset_name_opt
 : dataset_name ('(' variables '=' (~('('|')'))*? ')')?
 ;
 
datastmt_cmd
 : '/' DEBUG? NESTING? (STACK '=' INT)?
 ;
 
 // view-name <data-set-name-1 <(data-set-options-1)>>
view_dsname_opt
 : variables variables? ('(' variables '=' (~('('|')'))*? ')')?
 ;
 
view_name : variables  ;
dataset_name : variables;
program_name : variables;
passwd_opt  : '(' (ALTER|READ|PW) '=' (~('('|')'))*? ')' ;
source_opt : ('(' SOURCE '=' (SAVE | ENCRYPT | NOSAVE) ')') ;