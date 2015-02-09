grammar SAS;

@header {
	package org.opensas01.antlr4;
}

/* this grammar implements this script 
data crime;
  infile "crime.csv" delimiter="," firstobs=2;
  input sid state $ crime murder pctmetro pctwhite pcths poverty single;
run;

proc means data = crime;
  var crime poverty single;
run;
*/
parse
 : (sas_stmt_block)* EOF
 ;

// a statement block is either data statement, procedure block or new lines
sas_stmt_block
 : data_stmt_block
 | proc_stmt_block_list 
 ;

// must treat NEWLINE by hand, since raw data often delimited by newline
data_stmt_block
 : DATA ( ID_NULL | Identifier ) ';'
   data_stmt_list*
   RUN ';'
 ;

// here goes all supported data statements, either executive or declarative 
data_stmt_list
 : infile_stmt
 | input_stmt
 ;

// TODO: incomplete
infile_stmt
 : INFILE file_specification infile_options* ';'
 ;

file_specification
 : STRINGLITERAL  //filename
 | CARDS 
 | DATALINES 
 ;

infile_options
 : DELIMITER '=' STRINGLITERAL 
 | FIRSTOBS '=' INT 
 | OBS '=' INT
 ; 

input_stmt
 : INPUT (STRINGLITERAL '$')+ ';' 
 ;


// Specify SAS procedures one by one, because they do not have unify syntaxes
proc_stmt_block_list
 : proc_means_block
 | proc_freq_block
 ;
 
proc_freq_block
 : FREQ ';'
   RUN ';'
 ;


proc_means_block
 : PROC MEANS (proc_means_options)* (statistic_keyword)* ';'
   proc_means_stmt_list*
   RUN ';'
 ;

// TODO: incomplete, see goo.gl/mRH37N for more options
proc_means_options
 :	DATA '=' Identifier
 |	NOTRAP
 |	SUMSIZE '='
 ;
statistic_keyword
 : SK_MIN
 | SK_MAX
 | SK_MEAN
 | SK_N
 | SK_SUM
 | SK_VAR
 ;
spaced_identifiers
 : Identifier Identifier*
 ;

// TODO: incomplete, see http://goo.gl/DfW9KK 
proc_means_stmt_list
 : var_stmt
 | title_stmt
 ;

var_stmt
 : spaced_identifiers ';'
 ;

title_stmt
 : STRINGLITERAL ';'
 ;

Identifier
 : [a-zA-Z_] [a-zA-Z_0-9]*
 ;

INFILE: 'infile' ;
NOTRAP: 'notrap' ;
STRINGLITERAL : '"' (~["\r\n] | '""')* '"';
PROC : 'proc' ;
ID_NULL : '_null_' ;
DATA : 'data' ;
FREQ : 'freq' ;
RUN: 'run' ;
MEANS : 'means' ;
SUMSIZE : 'sumsize' ;
CARDS : 'cards' ;
CARDS4 : 'cards4' ;
DATALINES : 'datalines' ; 
DATALINES4 : 'datalines4' ;
DELIMITER : 'delim' | 'delimiter' ;
FIRSTOBS : 'firstobs' ;
OBS: 'obs' ;
INPUT: 'input' ;
INT: DIGIT+ ;
DIGIT: [0-9] ;
SK_MIN : 'MIN' ;
SK_MAX : 'MAX' ;
SK_MEAN : 'MEAN' ;
SK_N : 'N' ;
SK_SUM : 'SUM' ;
SK_VAR : 'VAR' ;
WS: [ \n\t\r]+ -> skip;

//end
