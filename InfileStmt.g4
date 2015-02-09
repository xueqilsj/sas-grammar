grammar InfileStmt;
import CommonGrammar ;
// import CommonLexerRules, CommonParserRules;
// options {tokenVocab=CommonLexerRules;}

infile_main
 : (infile_stmt)* EOF
 ;
infile_stmt
 : INFILE file_specification device_type? infile_options*  ';'
 ;

file_specification
 : STRINGLITERAL
 | Identifier
 | CARDS
 | CARDS4
 | DATALINES
 | DATALINES4
 ;
 
device_type
 : DISK
 | DUMMY
 | GTERM
 | PIPE
 | PLOTTER
 | PRINTER
 | TAPE
 | TEMP
 | TERMINAL
 | UPRINTER
 ;
 
// FIXME: here delimiter allows both character and string
infile_options
 : Identifier EQUAL expression
 | DSD
 | EXPANDTABS 
 | NOEXPANDTABS
 | FLOWOVER 
 | MISSOVER
 | PAD 
 | NOPAD
 | SCANOVER
 | SHAREBUFFERS
 | STOPOVER
 | TRUNCOVER
 | V_INFILE_
 ;
