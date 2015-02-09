grammar Expression;
options {tokenVocab=CommonLexerRules;}

// FIXME: normally positive/negative prefix come ahead of multiple or divide, but antlr4 seem not agree
// FIXME: I hate '=' as equal to operator so much that I use '==' instead
expression
 : literal
 | Identifier
 | '(' expression ')'
 | expression '(' expressionList? ')'
 | <assoc=right> expression '**' expression
 | <assoc=right> ('+'|'-') expression
 | NOT expression
 | expression MIN expression
 | expression MAX expression
 | expression ('*'|'/'|'%') expression
 | expression ('+'|'-') expression
 | expression ('||' | '!!' ) expression
 | expression (EQ | NE | GT | LT | GE | LE ) expression
 | expression (EQC | NEC | GTC | LTC | GEC | LEC ) expression
 | expression (IN | INC) in_var_list
 | expression (AND | OR ) expression
 ;
expressionList 
 : (expression | of_var_list) (',' (expression|of_var_list))*
 ;
  
of_var_list 
 : 'of' (Identifier '-' Identifier) ((COMMA 'of')? (Identifier '-' Identifier) )*
 ;
in_var_list
 : Identifier
 | '(' (literal|colonInts) (',' (literal|colonInts))* ')'
 ;
colonInts
 : INT ':' INT
 ;
literal
 : INT
 | FloatingPointLiteral
 | STRINGLITERAL
 | DateLiteral
 | TimeLiteral
 | DateTimeLiteral
 | BitLiteral
 | NameLiteral
 | HexLiteral
 | MissingValueLiteral
 ;

