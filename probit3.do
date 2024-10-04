mvprobit (tradernetwork  = Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize) ///
         (membershipassociationNetwork = Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize) ///
         (Friendshipnetwork  = Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize) ///
         (Neighborhoodnetwork = Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize)

		 
		 *replacing and recoding the variables
replace Ethnicity  = "Yoruba" if regexm(Ethnicity , "Yor")
replace Ethnicity  = "Yoruba" if regexm(Ethnicity , "Other")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Del")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Edo")
replace Ethnicity  = "Igbo" if regexm(Ethnicity ,"Ijaw")
replace gender  = "Female" if regexm(gender , "female")
replace gender  = "Female" if regexm(gender , "fe")


replace gender = "Male" if regexm (gender, "mal")
replace Levelsofeducation = "Formal education" if regexm(Levelsofeducation, "0 formal education")
mvprobit (tradernetwork  Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize 
tab1 membershipassociationNetwork Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize
tab1   Friendshipnetwork  Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize 
tab1 Neighborhoodnetwork Age gender Maritalstatus Levelsofeducation Householdsize Religion accesstoinformation  durationofrelationship frequentlymeeting networkdensity networksize
mvprobit (tradernetwork  = Age gender  networkdensity networksize) ///
         (membershipassociationNetwork = Age gender  networkdensity networksize) ///
         (Friendshipnetwork  = Age gender  networkdensity networksize) ///
         (Neighborhoodnetwork = Age gender  networkdensity networksize)
summarize Age gender networkdensity networksize tradernetwork membershipassociationNetwork Friendshipnetwork Neighborhoodnetwork
tabulate tradernetwork
tabulate membershipassociationNetwork
tabulate Friendshipnetwork
tabulate Neighborhoodnetwork
misstable summarize
destring Age, replace
foreach var in CJ{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}
