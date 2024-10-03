foreach var of varlist gender-residence{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}
rename en_* (*)
knowledgeofhepatitisbandtransmis-hbvcanbepreventedbyusinggloveswh


foreach var of varlist knowledg-oveswh{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}
v55-v64

foreach var of varlist v48-v54{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}
 cd "C:\Users\MY PC\Desktop\kabirat"

tabout v52-v63 using TableD.xls, oneway f(0 1) c(freq col) replace
drop if Age == .
