foreach	var of varlist	quantityperkg AW	{
destring `var',replace
}

foreach	var of varlist	BS Quantitysoldkgper BE	{
destring `var',replace
}

foreach	var of varlist	BM quantitypkg quantitykg	{
destring `var',replace

foreach	var of varlist	quantitypurchased AZ	{
destring `var',replace
}


