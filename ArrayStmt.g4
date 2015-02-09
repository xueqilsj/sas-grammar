grammar ArrayStmt;
import CommonGrammar;

array_main
 : (array_stmt)* EOF
 ;

array_stmt
 : ARRAY array_name LBracket array_subscript RBracket DOLLAR? INT? array_elements?  initial_value_list? ';';


array_name: Identifier ;
array_subscript 
 : '*'
 | INT (',' INT)*
 | INT ':' INT (',' INT ':' INT)*
 ; 
 
array_elements
 : ARRAY_NUMERIC_ELEMENTS
 | ARRAY_CHARACTER_ELEMENTS
 | ARRAY_ALL_ELEMENTS
 | Identifier+
 | Identifier '-' Identifier
 ;
 
initial_value_list
 : '('
    (initial_value_list_item)
    (COMMA? initial_value_list_item)*
   ')'
 ;

initial_value_list_item
 : INT ':' INT
 | constant_iter_value '*' initial_value_list
 | constant_iter_value '*' constant_value
 | constant_value
 ;

initial_value_list_bk
 : '('
    ((constant_iter_value '*' initial_value_list) | (constant_iter_value '*' constant_value) | constant_value)   
    (COMMA? ((constant_iter_value '*' initial_value_list) | (constant_iter_value '*' constant_value) | constant_value))*
   ')'
 ;
 
constant_iter_value
 : INT
 ;
 
constant_value
 : INT
 | FloatingPointLiteral
 | STRINGLITERAL
 ;

