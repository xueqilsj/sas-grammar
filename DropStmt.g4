grammar DropStmt;
import CommonGrammar ;

drop_main
 : (drop_stmt)* EOF
 ;
 
drop_stmt 
 : DROP (variables | variables '-' variables)+ ';'
 ;