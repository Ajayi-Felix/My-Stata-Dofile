

* Recode age into three categories
recode Age (18/30 = 1 "18-30") (31/45 = 2 "31-45") (46/max = 3 "45+"), generate(age_group)
* Define the labels
label define sex 1 "Male" 2 "Female"
label values age_group age_group_labels

label values gender sex


encode Indexo, generate(indexo)
recode gender ("female"= 2)

* Define the labels
label define occupation_labels 1 "Public employment" ///
                              2 "Private employment" ///
                              3 "Self employed" ///
                              4 "Student" ///
                              5 "Others"

							  * Attach the labels to the variable
label values occupation occupation_labels

encode TimeGiven, generate(timeGiven)

* Define the labels for tribes
label define tribe_labels 1 "Hausa" ///
                          2 "Igbo" ///
                          3 "Yoruba" ///
                          4 "Others"


* Attach the labels to the variable
label values ethnicity tribe_labels




* Define the labels for tooth types
label define tooth_labels 1 "First mandibular molar" ///
                          2 "Second mandibular molar"



* Define the labels for dental diagnoses
label define diagnosis_labels 1 "Caries and sequelae" ///
                             2 "Fracture" ///
                             3 "Failed restoration" ///
                             4 "Others"

* Attach the labels to the variable
label values indexo diagnosis_labels

destring FailedAnaesthesia, replace





recode FailedAnaesthesia(.= 0) (2= 1), generate(failedAnaesthesia)


* Define the labels
label define failedanaes_labels 0 "No" 1 "Yes"



* Attach the labels to the variable
label values  failedAnaesthesia failedanaes_labels



* Define the labels
label define during_labels 1 "During testing" 2 "During extraction time"



