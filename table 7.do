******commands require installation xtdcce2****

xtset ID Year

*****column 1*****
xtreg gva capital labor knowledge, fe

*****column 2******** 
xtreg gva capital labor knowledge gm10, fe


*****column 3******** 
esttab using result.tex, replace mtitles scalars("rmse S.E" "r2_pmg Adjusted R-squared" "cd CD" "cdp P-value of CD")
eststo: xtdcce2 gva capital labor knowledge gm10, reportconstant nocrosssectional

*****column 4******** 
eststo: xtdcce2 gva capital labor knowledge gs10, reportconstant nocrosssectional

*****column 5******** 
eststo: xtdcce2 gva capital labor knowledge gt10, reportconstant nocrosssectional

*****column 6******** 
eststo: xtdcce2 gva capital labor knowledge gt10, crosssectional(gva capital labor) reportconstant exponent