foreach var of varlist quantitysoldaveselling averageselling {
    replace `var' = subinstr(`var', ",", "", .)
}


foreach var of	varlist	payforstorerent	quantitybuypermonth	{
    replace	`var' =	subinstr(`var',	",", "", .)
}

foreach	var of varlist AX quatitybu  quantitybuy	BF	quantitypur	Averagesold	quantitysold	{
	replace `var' = subinstr(`var', ",", "",	.)
}



.	foreach var of	pkg_matCost storagecost	loading_CostNaira	transportCostNaira	payforlaborereverymonth{
	2.     replace	`var' = subinstr(`var',	",", "", .)
	3. }

	
.	foreach var of	pkg_matCost storagecost	loading_CostNaira	{
	2.     replace	`var' = subinstr(`var',	",", "", .)
	3. }

	foreach	var of varlist pkg_matCost storagecost loading_CostNaira	transportCostNaira	payforlaborereverymonth	{
2.	replace `var' = subinstr(`var', ",", "", .)
3. }


.	foreach var of	varlist	Averagesellingprice BT Aversellingprice	Sellingprice	Averageselling	{
	2.     replace	`var' =	subinstr(`var', ",", "", .)
	3. }

	
	