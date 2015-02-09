parser grammar CommonParserRules;
options {tokenVocab=CommonLexerRules;}
// FIXME: normally positive/negative prefix come ahead of multiple or divide, but antlr4 seem not agree
// FIXME: I hate '=' as equal to operator so much that I use '==' instead
expression
 : literal
 | Identifier
 | LParentheses expression RParentheses
 | expression LParentheses expressionList? RParentheses
 | expression LBraces expression RBraces
 | expression LSqBracket expression RSqBracket
 | <assoc=right> expression MUL MUL expression
 | <assoc=right> (ADD|SUB) expression
 | NOT expression
 | expression MIN expression
 | expression MAX expression
 | expression (MUL|DIV|PERCENT) expression
 | expression (ADD|SUB) expression
 | expression (VERLINE VERLINE | EXCLAMATION EXCLAMATION ) expression
 | expression (EQ | NE | GT | LT | GE | LE ) expression
 | expression (EQC | NEC | GTC | LTC | GEC | LEC ) expression
 | expression (IN | INC) in_var_list
 | expression (AND | OR ) expression
 | <assoc=right> expression EQUAL expression
 ;
expressionList
 : (expression | of_var_list) (COMMA (expression|of_var_list))*
 | expressionList COMMA+ expressionList
 ;
  
of_var_list 
 : OF (Identifier SUB Identifier) ((COMMA OF)? (Identifier SUB Identifier) )* 
 | OF Identifier Identifier*
 | OF Identifier LSqBracket MUL RSqBracket
 ;
in_var_list
 : Identifier
 | LParentheses (literal|colonInts) (COMMA (literal|colonInts))* RParentheses
 ;
colonInts
 : INT COLON INT
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
 
 