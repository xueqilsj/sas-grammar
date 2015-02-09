data example1 example2 (drop=IDnumber);
data _NULL_;
data phone_list / view=phone_list (source=encrypt);
data testfile / pgm=stored.test_program (alter=sales);
data view=inventory;
data pgm=stored.employee_list;
data error (keep=subject date weight);
data ourlib.test / view=ourlib.test;
data theirlib.test scoretot
   / view=theirlib.test;
data salesdata / pgm=stored.salesfig;
data employees / pgm=stored.items (alter=klondike);
data pgm=stored.items (alter=klondike);
data _null_ /nesting;
