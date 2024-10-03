foreach var of varlist Marital_Status-Please_specify_003{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}


rename Ageasatlastbirthday Age
rename MaritalStatus Marital
rename Religion Relig
rename Ethnicity Ethn
rename Faculty Fac
rename Placeofresidence Resid
rename Areyousexuallyactive SexAct
rename Doyouusecondom CondomUse
rename HowmanysexualpartnersdoyouhgY Partners
rename HumanpapillomavirusisaviralgY HPVviral
rename HumanpapillomaviruscancausegY HPVcause
rename VaginalbleedingisasymptomofgY VagBleed
rename SevereheadacheisasymptomofHgY Headache
rename BloodstainedvaginaldischargeigY VagDischarge
rename PainduringsexualintercourseisgY PainSex
rename HPVcanbetransmittedthroughfegY HPVtransFE
rename HPVcanbetransmittedthroughsegY HPVtransSE
rename HPVcanbetransmittedthroughphgY HPVtransPH
rename HPVcanbetransmittedthroughorgY HPVtransOR
rename ThefollowingareriskfactorsfogY HPVrisk
rename PreventionofHPVinfectioncanbgY HPVprevent
rename HPVvaccinepreventagainstthefgY HPVvaxPrevent
rename RouteofHPVvaccineadministratigY HPVvaxRoute
rename WhatistherecommendeddoseforgY HPVvaxDose
rename WhatistherecommendedageforvgY HPVvaxAge
rename WhoshouldbevaccinatedagainstgY HPVvaxWho
rename EverreceivedHPVvaccine HPVvaxReceived
rename Doyoucompleteyourvaccine HPVvaxComplete
rename AreyouwillingtobevaccinatedgY HPVvaxWilling
rename WillyourecommendthevaccinetogY HPVvaxRecommend
rename IfthereisacostattachedtothgY HPVvaxCost
rename IamwillingtotakeHPVvaccinegY HPVvaxTake
rename IwilltakethevaccineifitisgY HPVvaxTakeIfItIs
rename IwilltakethevaccineifIhavegY HPVvaxTakeIfHave
rename IamwillingtotakethevaccinegY HPVvaxWillingToTake
rename IcantakethevaccineifmyparegY HPVvaxTakeIfParent
rename KindlyindicatefactorsthataregY HPVfactors

