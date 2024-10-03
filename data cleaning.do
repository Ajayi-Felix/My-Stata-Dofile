foreach var of varlist State_of_Interview-Mothers_Age{
destring `var',replace
}


foreach var of varlist Marital_Status-Please_specify_003{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}

foreach var of varlist Years_of_residence_in_the_loca Number_of_eligible_children_1{
destring `var',replace
}
