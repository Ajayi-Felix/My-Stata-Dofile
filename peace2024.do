use "C:\Users\MY PC\Desktop\nursing1\nurse1.dta"
do "C:\Users\MYPC~1\AppData\Local\Temp\STD2264_000000.tmp"
do "C:\Users\MYPC~1\AppData\Local\Temp\STD2264_000000.tmp"
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
su knowscore perceptionscore
su knowscore perceptionscore,d
do "C:\Users\MYPC~1\AppData\Local\Temp\STD2264_000000.tmp"
tab perception_category
tab perception_quartile
tab perceptionscore
drop perception_quartile perception_category
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
su knowscore perceptionscore,d
tab knowscore
su knowscore perceptionscore,d
recode knowscore (38/85 =1 "poor knowledge") (86/102=2 "average") (88/112=3 "good")
recode knowscore (38/85 =1 "poor knowledge") (86/102=2 "average") (88/112=3 "good"),gen(knowcat)
tab knowcat
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
recode percepscore (0/25 =1 "poor percep") (26/28=2 "average") (29/30=3 "good"),gen(percat)
recode percepscore (0/25 =1 "poor percep") (26/28=2 "average") (29/30=3 "good"),gen(percat),gen(percepcat)
recode percepscore (0/25 =1 "poor percep") (26/28=2 "average") (29/30=3 "good"),gen(percepcat)
recode perceptionscore(0/25 =1 "poor percep") (26/28=2 "average") (29/30=3 "good"),gen(percepcat)
tab percepcat
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
tab percepcat knowcat,chi
tab age
su age
su age
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
recode  (0/25 =1 "poor percep") (26/28=2 "average") (29/30=3 "good"),gen(percepcat)
tab age
recode  age (16/25 =1 " 16-25") (26/34=2 "26-34"),gen(agecat)
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
tab agecat
tab agecat percepcat
tab en_maritalstatus percepcat
tab en_gender percepcat
tab level percepcat
tab agecat percepcat,chi
tab en_maritalstatus percepcat,chi
tab en_gender percepcat,chi
tab level percepcat,chi
tab level knowcat,chi
tab knowcat
tab level knowcat,chi
tab agecat knowcat,chi
tab en_maritalstatus knowcat,chi
tab en_gender knowcat,chi
tab percepcat
tab knowcat
tab percepcat
save "C:\Users\MY PC\Desktop\nursing1\nurse1.dta", replace
