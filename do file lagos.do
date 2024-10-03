recode s01q04a (0/5=1) (6/14=2) (15/24=3) (25/54=4) (55/64=5) (65/120=6),gen(age_recode)
recode s02q07  (0=1 "None") (1/3=2 "Nursery") (11/16=3 "Primary") (21/28 33=4 "Secondary") (31 34/424=5 "Post sec") ,gen(edu_recode)
xtile quintile= totcons_adj [aw= wt_final ], n(5)
tab s04aq04
egen total_row = total(s03q11__1 -s03q11__5), by(_n)
gen unmet_need = 0

foreach reason in s03q11__1 -s03q11__5 {
  replace unmet_need = 1 if `reason' == 1
}

gen did_not_access = 1 - unmet_need

egen OOP_health_care_expenditure = rowtotal(health31 health32)

gen E10 = .
gen E25 = .
gen E30 = .
gen E40 = .

replace E10 = 1 if OOP_health_care_expenditure / totcons_adj > ten_percent
replace E25 = 1 if OOP_health_care_expenditure / totcons_adj > twentyfive_percent
replace E30 = 1 if OOP_health_care_expenditure / totcons_adj > thirty_percent
replace E40 = 1 if OOP_health_care_expenditure / totcons_adj > forty_percent

generate ten_percent = 0.10 * totcons_adj
generate twentyfive_percent = 0.25 * totcons_adj
generate thirty_percent = 0.30 * totcons_adj
generate forty_percent = 0.40 * totcons_adj

generate ten_percent1 = 0.11 * totcons_adj
generate ten_percent2 = 0.20 * totcons_adj


replace E10 = 1 if Ti / xi > 0.1
replace E25 = 1 if Ti / xi > 0.25
replace E30 = 1 if Ti / xi > 0.3
replace E40 = 1 if Ti / xi > 0.4


gen e = 0
replace E = 1 if Ti / xi > 0.1







replace E10 = 1 if OOP_health_care_expenditure / totcons_adj > 0.1
replace E10 = 0 if OOP_health_care_expenditure / totcons_adj <= 0.1

replace E25 = 1 if OOP_health_care_expenditure / totcons_adj > 0.25
replace E25 = 0 if OOP_health_care_expenditure / totcons_adj <= 0.25

replace E30 = 1 if OOP_health_care_expenditure / totcons_adj > 0.3
replace E30 = 0 if OOP_health_care_expenditure / totcons_adj <= 0.3

replace E40 = 1 if OOP_health_care_expenditure / totcons_adj > 0.4
replace E40 = 0 if OOP_health_care_expenditure / totcons_adj <= 0.4

egen H25 = mean(E25)
scalar hhsize = _N
scalar H = H * hhsize

egen H_10 = mean(E10)
egen H_25 = mean(E25)
egen H_30 = mean(E30)
egen H_40 = mean(E40)

scalar hhsize = _N
scalar H_10 = H_10 * hhsize
scalar H_25 = H_25 * hhsize
scalar H_30 = H_30 * hhsize
scalar H_40 = H_40 * hhsize

bysort sector : tab1 H_10 H_25 H_30 H_40

bysort zone : tab1 H_10 H_25 H_30 H_40

