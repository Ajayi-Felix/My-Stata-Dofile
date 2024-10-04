foreach	var of varlist	quantityperkg AW	{
replace `var'	= subinstr(`var', "kg", "", .)
}

foreach	var of varlist	BS Quantitysoldkgper BE	{
replace `var'	= subinstr(`var', "kg", "", .)
}

foreach	var of varlist	BM quantitypkg quantitykg	{
replace `var'	= subinstr(`var', "kg", "", .)
}

foreach	var of varlist	quantitypurchased AZ	{
replace `var'	= subinstr(`var', "kg", "", .)
}


