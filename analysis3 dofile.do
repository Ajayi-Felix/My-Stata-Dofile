import excel "C:\Users\MY PC\Desktop\Dr arije3\Final Breast cancer database_Ayeni 010824.xlsx", sheet("Sheet1") firstrow
drop AI-BF
drop PatientID

*trimming variables
replace Ethnicity= trim(Ethnicity)
replace Maritalstatus = trim( Maritalstatus )
replace Levelofeducation = trim( Levelofeducation )
replace OralContraceptivesPills = trim(OralContraceptivesPills )
replace Alcoholintake   = trim(Alcoholintake  )
replace Menopausalstatus    = trim(Menopausalstatus )
replace Hxofbreastfeeding= trim(Hxofbreastfeeding)
replace   PersonalhistoryofBreastCa   = trim( PersonalhistoryofBreastCa  )
replace PersonalhistoryofOvarianCa  = trim(PersonalhistoryofOvarianCa)
replace Radiationtherapytothechest    = trim(Radiationtherapytothechest  )
replace Previoushighrisklesion  = trim(Previoushighrisklesion  )


*replacing and recoding the variables
replace Ethnicity  = "Yoruba" if regexm(Ethnicity , "Yor")
replace Ethnicity  = "Yoruba" if regexm(Ethnicity , "Other")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Del")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Edo")
replace Ethnicity  = "Igbo" if regexm(Ethnicity ,"Ijaw")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Kil")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "Urogbo")
replace Ethnicity  = "Igbo" if regexm(Ethnicity , "igbo")




replace Maritalstatus  = "Married" if regexm(Maritalstatus, "mar")
replace Maritalstatus  = "Married" if regexm(Maritalstatus, "Marr")
replace Maritalstatus  = "Widowed" if regexm(Maritalstatus, "widowed")


replace  Levelofeducation  = "None" if regexm( Levelofeducation , "Married")
replace  Levelofeducation  = "Postgraduate" if regexm( Levelofeducation , "Po")
replace  Levelofeducation  = "Tertiary" if regexm( Levelofeducation , "Ter")
recode Levelofeducation (2 5 =2)

replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "Menopaual"
replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "Menopaulsal"
replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "Menopusal"
replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "Menoupausal"
replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "Menpausal"
replace  Menopausalstatus = "Menopausal" if Menopausalstatus == "menopausal"
replace  Menopausalstatus = "Pre-menopausal" if Menopausalstatus == "Premenopausal"

replace   BRCA12   = "No" if  BRCA12    == "no"

replace  FamilyhistoryofBreastCa = "Yes" if FamilyhistoryofBreastCa  == "yes"
replace  FamilyhistoryofBreastCa = "No" if FamilyhistoryofBreastCa  == "no"

replace  TimeofoccurrenceofpersonalB    = "N.A" if  TimeofoccurrenceofpersonalB    == "No"
replace  Radiationtherapytothechest     = "Yes" if  Radiationtherapytothechest      == "Yes (X-RAY)"

replace Previoushighrisklesion   = "No" if regexm(Previoushighrisklesion , "I")
replace Previoushighrisklesion   = "Yes" if regexm(Previoushighrisklesion , "Yes")
replace  FinalBIRADScategoty       = "4B" if  FinalBIRADScategoty       == "4b"
Not clear what the categorues should be

replace TimeofoccurrenceofpersonalB = trim(TimeofoccurrenceofpersonalB)
replace Maritalstatus  = "Widowed" if regexm(Maritalstatus , "Sep")

*Encoding the variables
foreach var in Ethnicity Maritalstatus Levelofeducation{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
}
rename en_* (*)



foreach var in Typeofmenarche Typeofparousparitylowvsmu TypeofparityNulliparousvsp{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

foreach var in Typeofchildbirthinterval OralContraceptivesPills Hormonereplacementtherapy Alcoholintake Menopausalstatus{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

foreach var in PersonalhistoryofBreastCa TimeofoccurrenceofpersonalB PersonalhistoryofOvarianCa Radiationtherapytothechest Previoushighrisklesion{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

foreach var in Obesity Breastcancerrisklevel Modeofpresentation{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

foreach var in Hxofbreastfeeding FamilyhistoryofBreastCa FamilyhistoryofOvarianCa BRCA12{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

foreach var in Parity Firstconfinementage Lastconfinementage Childbirthintervalinyears{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}


foreach var in MBD FinalBIRADScategoty{
encode `var',gen(en_`var')
order en_`var',after (`var')
drop `var'
rename en_* (*)
}

* Creating a new age variable for advanced age
gen age_category = "greater than 50 or equal to 50" if Ageatlastbirthday >= 50
replace age_category = "less than 50" if Ageatlastbirthday < 50
order age_category, after( Ageatlastbirthday)
rename age_category AdvancedAge

* Creating a new variable for early menarch
gen menarch_category = "late menarch" if AgeatMenarche >= 12
replace menarch_category = "early menarch" if AgeatMenarche < 12
order menarch_category, after (AgeatMenarche)


* Creating a new variable for None/ short duration of breast feeding
gen shortdurationbreastfeeding = " Not short duration of breast feeding" if Totalbreastfeedingdurationin >= 12
replace shortdurationbreastfeeding = "None/ short duration of breast feeding" if Totalbreastfeedingdurationin < 12
order shortdurationbreastfeeding, after (Totalbreastfeedingdurationin)



*recoding Dense Breast
recode MBD (3 4=1) (1 2=2),gen(densebreast)



*dichotomizing the study participants into average-risk and high-risk women
gen  risk = .
replace  risk = 1 if Ageatlastbirthday >=40
replace  risk = 2 if Ageatlastbirthday >=40 & (PersonalhistoryofBreastCa==2 | PersonalhistoryofOvarianCa ==2 |FamilyhistoryofBreastCa ==2)
label define risk 1 averagerisk 2 highrisk
label values risk risk

* creating variable for Long birth interval
gen birthinterval = "long birth interval" if Childbirthintervalinyears > 8
replace birthinterval = "not long birth interval" if Childbirthintervalinyears <=8



*not sure of the variable that captures 5)	Age at first full term pregnancy after 30 years 
* Generating a categorical variables for age 
gen  agecat = .
replace  agecat = 1 if Ageatlastbirthday < 40
replace  agecat = 2 if Ageatlastbirthday >= 40 & Ageatlastbirthday <= 50
replace  agecat = 3 if Ageatlastbirthday > 50 & Ageatlastbirthday <= 60
replace  agecat = 4 if Ageatlastbirthday > 60 & Ageatlastbirthday <= 70
replace  agecat = 5 if Ageatlastbirthday > 70
order agecat, after(Ageatlastbirthday)
su Ageatlastbirthday


graph bar (count),  over(MBD) over(BIRAD) stack percent asyvars
title("Distribution of MBD Patterns within Each BIRADS Category") ///
ylabel(0(10)100, angle(horizontal)) ///
legend(order(1 "ACR-A" 2 "ACR-B" 3 "ACR-C" 4 "ACR-D")) ///
ytitle("Percentage (%)")



tab MBD BIRAD,lrchi col
tab MBD Breastcancerrisklevel,lrchi col
tab  AdvancedAge dense,lrchi col
tab  FamilyhistoryofBreastCa dense,lrchi col
tab  PersonalhistoryofOvarianCa dense,lrchi col
tab  FamilyhistoryofOvarianCa dense,lrchi col
tab  birthinterval  dense,lrchi col
tab  shortdurationbreastfeeding  dense,lrchi col
tab  Hormonereplacementtherapy  dense,lrchi col
tab  OralContraceptivesPills  dense,lrchi col
tab  menarch_category  dense,lrchi col
tab  TypeofparityNulliparousvsp dense,lrchi col
tab  Radiationtherapytothechest dense,lrchi col
tab  Alcoholintake dense,lrchi col
tab  Obesity dense,lrchi col



tab  AdvancedAge MBD,lrchi col
tab  FamilyhistoryofBreastCa MBD,lrchi col
tab  PersonalhistoryofOvarianCa MBD,lrchi col
tab  PersonalhistoryofBreastCa MBD,lrchi col
tab  FamilyhistoryofOvarianCa MBD,lrchi col
tab  Typeofchildbirthinterval MBD,lrchi col
tab  shortdurationbreastfeeding  MBD,lrchi col
tab  Hormonereplacementtherapy  MBD,lrchi col
tab  OralContraceptivesPills  MBD,lrchi col
tab  densebreast MBD,lrchi col
tab  TypeofparityNulliparousvsp MBD,lrchi col
tab  Radiationtherapytothechest MBD,lrchi col
tab  Alcoholintake MBD,lrchi col
tab  Obesity MBD,lrchi col
tab  Menopausalstatus MBD,lrchi col

graph pie, over(MBD) plabel(_all percent , format(%2.1f) gap(10)) plabel(_all name )

graph bar, over(MBD)blabel(bar, format(%4.1f))
 PersonalhistoryofBreastCa  

gen Firstconfinementage1 = firstconfinementage_string if Firstconfinementage != "NA"
gen Firstconfinementage_clean = Firstconfinementage if Firstconfinementage != 28
destring Firstconfinementage_clean,replace
destring Firstconfinementage,replace
tab Firstconfinementage_clean
recode Firstconfinementage (31/42=1) (0/30=2)if !missing(Firstconfinementage),gen(Firstconfinementage_clean)
tab Firstconfinementage_clean

logistic  Breastcancerrisklevel MBD AdvancedAge Alcoholintake Obesity  FamilyhistoryofBreastCa PersonalhistoryofOvarianCa FamilyhistoryofOvarianCa
mlogit mbd_pattern i.risk_group age bmi family_history, baseoutcome(ACR-A)


mlogit mbd_pattern i.risk_group ///
    i.age50 i.fam_hist_breast_cancer i.fam_hist_ovarian_cancer ///
    i.personal_hist_breast_cancer i.personal_hist_ovarian_cancer ///
    i.nulliparity i.long_spacing_childbirth ///
    i.breastfeeding_duration i.hormone_replacement_therapy ///
    i.ocp i.early_menarche ///
    i.late_first_pregnancy i.late_menopause ///
    i.obesity i.alcohol_consumption ///
    i.radiation_therapy i.dense_breast, baseoutcome(ACR-A)

	
	
	logistic Breastcancerrisklevel  i.MBD ///
    b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
    i.PersonalhistoryofBreastCa i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest 

	
	logistic PersonalhistoryofBreastCa b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
     i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest 

	
	
		logistic PersonalhistoryofBreastCa i.MBD b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
     i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest 

	mlogit MBD i.Breastcancerrisklevel   ///
    b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
    i.PersonalhistoryofBreastCa i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest,rrr
	
	
logistic PersonalhistoryofBreastCa i.MBD 
logistic PersonalhistoryofBreastCa b2.AdvancedAge1 
logistic PersonalhistoryofBreastCa i.FamilyhistoryofBreastCa 
logistic PersonalhistoryofBreastCa b2.FamilyhistoryofOvarianCa 
logistic PersonalhistoryofBreastCa i.PersonalhistoryofOvarianCa 
logistic PersonalhistoryofBreastCa b2.TypeofparityNulliparousvsp 
logistic PersonalhistoryofBreastCa b2.Typeofchildbirthinterval1 
logistic PersonalhistoryofBreastCa i.shortdurationbreastfeeding1  
logistic PersonalhistoryofBreastCa i.Hormonereplacementtherapy 
logistic PersonalhistoryofBreastCa i.OralContraceptivesPills 
logistic PersonalhistoryofBreastCa i.Typeofmenarche   
logistic PersonalhistoryofBreastCa b3.Menopausalstatus 
logistic PersonalhistoryofBreastCa i.Obesity 
logistic PersonalhistoryofBreastCa i.Alcoholintake 
logistic PersonalhistoryofBreastCa i.Radiationtherapytothechest 
	
	
logistic Breastcancerrisklevel i.MBD 
logistic Breastcancerrisklevel b2.AdvancedAge1 
logistic Breastcancerrisklevel i.FamilyhistoryofBreastCa 
logistic Breastcancerrisklevel b2.FamilyhistoryofOvarianCa 
logistic Breastcancerrisklevel i.PersonalhistoryofOvarianCa 
logistic Breastcancerrisklevel b2.TypeofparityNulliparousvsp 
logistic Breastcancerrisklevel b2.Typeofchildbirthinterval1 
logistic Breastcancerrisklevel i.shortdurationbreastfeeding1  
logistic Breastcancerrisklevel i.Hormonereplacementtherapy 
logistic Breastcancerrisklevel i.OralContraceptivesPills 
logistic Breastcancerrisklevel i.Typeofmenarche   
logistic Breastcancerrisklevel b3.Menopausalstatus 
logistic Breastcancerrisklevel i.Obesity 
logistic Breastcancerrisklevel i.Alcoholintake 
logistic Breastcancerrisklevel i.PersonalhistoryofBreastCa 
		
	
	
	
	
	
	
	
	
	
	
mlogit BIRAD i.MBD,rrr
logistic BIRAD b2.AdvancedAge1 
logistic BIRAD i.FamilyhistoryofBreastCa 
logistic BIRAD b2.FamilyhistoryofOvarianCa 
logistic BIRAD i.PersonalhistoryofOvarianCa 
logistic BIRAD b2.TypeofparityNulliparousvsp 
logistic BIRAD b2.Typeofchildbirthinterval1 
logistic BIRAD i.shortdurationbreastfeeding1  
logistic BIRAD i.Hormonereplacementtherapy 
logistic BIRAD i.OralContraceptivesPills 
logistic PBIRAD i.Typeofmenarche   
logistic BIRAD b3.Menopausalstatus 
logistic BIRAD i.Obesity 
logistic BIRAD i.Alcoholintake 
logistic BIRAD i.Radiationtherapytothechest 	
	
mlogit BIRAD i.MBD b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
     i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest,rrr	
	
	mlogit BIRAD i.MBD b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
     i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest, rrr
	
	
	
	
	FinalBIRADScategoty
	
	
	mlogit FinalBIRADScategoty i.MBD,rrr
	mlogit BIRAD i.MBD,b(1) rrr
	
	
	mlogit MBD i.Breastcancerrisklevel   ///
    b2.AdvancedAge1 i.FamilyhistoryofBreastCa b2.FamilyhistoryofOvarianCa ///
    i.PersonalhistoryofBreastCa i.PersonalhistoryofOvarianCa ///
    b2.TypeofparityNulliparousvsp b2.Typeofchildbirthinterval1 ///
    i.shortdurationbreastfeeding1  i.Hormonereplacementtherapy ///
    i.OralContraceptivesPills i.Typeofmenarche   ///
	b3.Menopausalstatus ///
    i.Obesity i.Alcoholintake ///
    i.Radiationtherapytothechest,rrr
	
	
	
	
	
	* Generate frequencies for each combination of MBD and risk_group
bysort Breastcancerrisklevel MBD: gen freq = _N

* Calculate total frequencies for each risk_group
bysort Breastcancerrisklevel: egen total_count = total(freq)

* Calculate column percentages
gen pct = 100 * (freq / total_count)

* Verify the data
list MBD Breastcancerrisklevel freq total_count pct
	
	
	
	graph bar (mean) pct, over(MBD, gap(0)) over(Breastcancerrisklevel, gap(0))

graph bar pct, over(MBD, gap(0)) over(Breastcancerrisklevel, gap(0))

graph bar pct, over(MBD) over(Breastcancerrisklevel, gap(20))

