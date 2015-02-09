data bodyfat;
   Input age pctfat;
datalines;
23	28
39	31
41	26
49	25
50	31
53	35
53	42
54	29
56	33
57	30
58	33
58	34
60	41
61	34
;
proc print data=bodyfat;
run;
proc corr data=bodyfat;
run;
