foreach var of varlist PleasetickappropriateboxD AI AJ PleasetickappropriateboxH PleasetickappropriateboxA PleasetickappropriateboxT AO AP{
recode `var' (1 5 7=1) (2 3 4 6=0),gen(an_`var')

order an_`var',after (`var')
drop `var'
}

