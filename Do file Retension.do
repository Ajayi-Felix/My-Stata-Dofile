
cd "C:\Users\MY PC\Desktop\Dr Arije"


// Table 1
tabout geop_zones R_12 R_142 using Table1.xls, oneway f(0 1) c(freq col) npos (row) replace

//Table 2


tabout cat_age R_133 R_134 cat_exp using Table2.xls, oneway f(0 1) c(freq col) npos (row) replace

// Categorising age
recode T_132 (20/39 = 1) (40/59 = 2) (60/64 = 3), gen(cat_age)
label variable cat_age "Categorized Age"
label define age_labels 1 "20-39" 2 "40-59" 3 "60+"
label values cat_age age_labels
order cat_age, after( T_132 )

 //categorising Experience


recode T_135 (1/5 = 1) (6/10 = 2) (11/15= 3) (16/max =4) , gen(cat_exp)
label variable cat_exp "categorized experience"
label define expe_labels 1 "1-5" 2 "6-10" 3 "11-15" 4 "15+"
label values cat_exp expe_labels
order cat_exp, after( T_135 )

// Finding mean and std for Age and experience

su T_132 T_135

// using tab because it cannot be used with tabout command

tab1 R_28-C_29_7

//Table 3

tabout  R_25 R_27  R_30-R_32 R_33  using Table3.xls, oneway f(0 1) c(freq col) npos (row) replace

// Table 4
tabout R_35 R_36 C_37_1-C_38_5 R_39 R_40-R_45 R_46 R_47  using Table4.xls, oneway f(0 1) c(freq col) npos (row) replace

// Table 5

tabout C_49_1-C_49_7 C_50_1-R_51 R_52 R_53 R_54 R_55 R_56 R_57 R_58 C_62_1-C_62_5 R_63 R_65 using Table5.xls, oneway f(0 1) c(freq col) npos (row) replace

// Table 6
tabout C_75_1-C_75_4 R_77 R_78 C_79_1-C_79_4 using Table6.xls, oneway f(0 1) c(freq col) npos (row) replace



// Table 7
tabout C_81_1-C_81_6 C_82_1-C_82_5 C_83_1-C_83_9 R_84 R_85 R_86 R_87 R_88 R_89 R_90 R_91 R_92 R_94 R_95 R_96-C_97_8  using Table7.xls, oneway f(0 1) c(freq col) npos (row) replace

// Table 8

tabout R_99 C_100_1-C_101_5 R_102 R_103 R_104 R_108 R_109 R_110 R_111 C_112_1-C_112_5 C_113_1-C_113_9 C_114_1-C_114_9 using Table8.xls, oneway f(0 1) c(freq col) npos (row) replace

R_99 C_100_1-C_101_5 R_102 R_103 R_104 R_108 R_109 R_110 R_111 C_112_1-C_112_5 C_113_1-C_113_9 C_114_1-C_114_9
// using tab because it cannot be used with tabout command
tab1 C_93_1- C_93_8


