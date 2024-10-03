foreach var of  varlist Dosemissedopv1-Dosemissedbcg {
tab `var' 
display `var'
}


foreach var of  varlist Dosemissedopv1-Dosemissedbcg {
bys Stratum_id:tab `var' 
}
translate "C:\Users\MY PC\Desktop\Stata13\prevalence_of_antigens_missed_opportunities_as_all_and_urban_&_rural.smcl" "C:\Users\MY PC\Desktop\Stata13\prevalence_of_antigens_missed_opportunities_as_all_and_urban_&_rural.pdf"
