quantitysoldaveselling averageselling payforstorerent	quantitybuypermonth	
    

 AX quatitybu  quantitybuy	BF	quantitypur	Averagesold	quantitysold	
	

pkg_matCost storagecost	loading_CostNaira	transportCostNaira	payforlaborereverymonth
	

Averagesellingprice BT Aversellingprice	Sellingprice	Averageselling


destring `var',replace
	
	
	foreach var of varlist quantitysoldaveselling averageselling {
    destring `var',replace
	
    }


foreach var of	varlist	payforstorerent	quantitybuypermonth	payforstorerent{
    destring `var',replace
	
}

foreach	var of varlist AX quatitybu  quantitybuy	BF	quantitypur	Averagesold	quantitysold	{
	destring `var',replace
	
}



foreach var of	varlist pkg_matCost storagecost	loading_CostNaira	transportCostNaira	payforlaborereverymonth{
	destring `var',replace
	
}

	
	foreach	var of varlist pkg_matCost storagecost loading_CostNaira	transportCostNaira	payforlaborereverymonth	{
    destring `var',replace
	
    }


foreach var of	varlist	Averagesellingprice BT Aversellingprice	Sellingprice	Averageselling	{
	destring `var',replace
	
}

foreach var of	varlist	pkg_matCost saletax BM	quantitypkg	quantitykg	quantitypkg{
	destring `var',replace
	
}	
	