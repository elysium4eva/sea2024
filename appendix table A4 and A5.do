save "D:\desktop\SEAI 2021\replication\with 5 10 15 units.dta", replace
*********table A4******
*********regional production regression with 5 pervasive units*********
eststo: xtdcce2 gva capital labor knowledge gm5, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs5, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt5, reportconstant crosssectional(_all)

*********regional production regression with 10 pervasive units*********
eststo: xtdcce2 gva capital labor knowledge gm10, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs10, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt10, reportconstant crosssectional(_all)

*********regional production regression with 15 pervasive units*********
eststo: xtdcce2 gva capital labor knowledge gm15, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs15, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt15, reportconstant crosssectional(_all)

*********regional production regression with 20 pervasive units*********
eststo: xtdcce2 gva capital labor knowledge gm20, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs20, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt20, reportconstant crosssectional(_all)
esttab using result.tex, replace mtitles scalars("rmse S.E" "r2_pmg Adjusted R-squared" "cd CD" "cdp P-value of CD")
est clear


*********table A5******
eststo: xtdcce2 gva capital labor knowledge gs5, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt5, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs10, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt10, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs15, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt15, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gs20, reportconstant crosssectional(_all)
eststo: xtdcce2 gva capital labor knowledge gt20, reportconstant crosssectional(_all)
esttab using result.tex, replace mtitles scalars("rmse S.E" "r2_pmg Adjusted R-squared" "cd CD" "cdp P-value of CD")