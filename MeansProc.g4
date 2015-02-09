grammar MeansProc;
import CommonGrammar ;

means_main
 : (means_proc)* EOF
 ;
 
means_proc 
 : DROP (variables | variables '-' variables)+ ';'
 ;