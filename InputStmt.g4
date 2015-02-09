grammar InputStmt;
import CommonGrammar ;

input_main
 : (input_stmt | put_stmt)* EOF
 ;
input_stmt
 : INPUT input_specification* INPUT_ODS? (AT | AT AT)? ';'
 ;

put_stmt
 : PUT put_specification* INPUT_ODS? (AT | AT AT)? ';'
 ;

input_specification
 : pointer_control
 | input_variable_format
 | column_specifications
 | '(' identifiers_list ')' '(' informat_list ')' 
 ;

put_specification
 : pointer_control
 | put_variable_format
 | column_specifications
 | '(' identifiers_list ')' '(' informat_list ')'
 ;

pointer_control
 : line_point_control
 | column_point_control
 ;
 
informat_list 
 : (Informat COMMA? (pointer_control)? )+
 ;
 
input_variable_format 
 : input_variable EQUAL?  format_modifier? Informat?
 | input_variable EQUAL? format_modifier? DOLLAR?
 ;
input_variable 
 : variables
 | variables '-' variables
 | variables '{' '*' '}'
 ;
 
put_variable_format
 : put_variable EQUAL?  format_modifier? Informat?
 | put_variable EQUAL? format_modifier? DOLLAR?
 ;
put_variable
 : V_INFILE_
 | ARRAY_ALL_ELEMENTS
 | input_variable
 | (INT '*')? STRINGLITERAL
 | literal
 ;


column_point_control
 : AT INT
 | AT FloatingPointLiteral
 | AT Identifier
 | AT '(' expression ')'
 | '+' INT
 | '+' Identifier
 | '+' FloatingPointLiteral
 | '+' '(' expression ')'
 ;
 
line_point_control
 : '#' INT
 | '#' FloatingPointLiteral
 | '#' '(' expression ')'
 | '/'
 ;
 
format_modifier
 : '?' 
 | '??'
 | '&'
 | ':'
 | '~'
 ;
 
column_specifications
 : INT '-' INT
 ;
 
 