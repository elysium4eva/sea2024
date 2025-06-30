
***********data extracted from gravity data abtained from https://www.cepii.fr/CEPII/en/bdd_modele/bdd_modele_item.asp?id=8*******
***********drop non eu countries**********
keep if iso3_o=="AUT" | iso3_o=="BEL" | iso3_o=="BGR" | iso3_o=="CYP" | iso3_o=="CZE" | iso3_o=="DEU" | iso3_o=="DNK" | iso3_o=="EST" | iso3_o=="GRC" | iso3_o=="ESP" | iso3_o=="FIN" | iso3_o=="FRA" | iso3_o=="HRV" | iso3_o=="HUN" | iso3_o=="IRL" | iso3_o=="ITA" | iso3_o=="LTU" | iso3_o=="LUX" | iso3_o=="LVA" | iso3_o=="MLT" | iso3_o=="NLD" | iso3_o=="POL" | iso3_o=="PRT" | iso3_o=="ROU" | iso3_o=="SWE" | iso3_o=="SVN" | iso3_o=="SVK" | iso3_o=="GBR"
keep if iso3_d=="AUT" | iso3_d=="BEL" | iso3_d=="BGR" | iso3_d=="CYP" | iso3_d=="CZE" | iso3_d=="DEU" | iso3_d=="DNK" | iso3_d=="EST" | iso3_d=="GRC" | iso3_d=="ESP" | iso3_d=="FIN" | iso3_d=="FRA" | iso3_d=="HRV" | iso3_d=="HUN" | iso3_d=="IRL" | iso3_d=="ITA" | iso3_d=="LTU" | iso3_d=="LUX" | iso3_d=="LVA" | iso3_d=="MLT" | iso3_d=="NLD" | iso3_d=="POL" | iso3_d=="PRT" | iso3_d=="ROU" | iso3_d=="SWE" | iso3_d=="SVN" | iso3_d=="SVK" | iso3_d=="GBR"

***********drop early years************
drop if year<1991

************generate schengen, euro variables**************
gen schengen_o=1 if iso3_o=="AUT" && year>1997| iso3_o=="BEL" && year>1995| iso3_o=="BGR" && year>2050| iso3_o=="CYP" && year>2050| iso3_o=="CZE" && year>2007| iso3_o=="DEU" && year>1995| iso3_o=="DNK" && year>2001| iso3_o=="EST" && year>2007| iso3_o=="GRC" && year>2000 | iso3_o=="ESP" && year>1995| iso3_o=="FIN" && year>2001| iso3_o=="FRA" && year>1995| iso3_o=="HRV" && year>2023| iso3_o=="HUN" && year>2007| iso3_o=="IRL" && year>2050| iso3_o=="ITA" && year>1997| iso3_o=="LTU" && year>2007| iso3_o=="LUX" && year>1995| iso3_o=="LVA" && year>2007| iso3_o=="MLT" && year>2007| iso3_o=="NLD" && year>1995| iso3_o=="POL" && year>2007| iso3_o=="PRT" && year>1995| iso3_o=="ROU" && year>2050| iso3_o=="SWE" && year>2001| iso3_o=="SVN" && year>2007| iso3_o=="SVK" && year>2007| iso3_o=="GBR" && year>2050
replace schengen_o=0 if schengen_o!=1

gen schengen_d=1 if iso3_d=="AUT" && year>1997| iso3_d=="BEL" && year>1995| iso3_d=="BGR" && year>2050| iso3_d=="CYP" && year>2050| iso3_d=="CZE" && year>2007| iso3_d=="DEU" && year>1995| iso3_d=="DNK" && year>2001| iso3_d=="EST" && year>2007| iso3_d=="GRC" && year>2000 | iso3_d=="ESP" && year>1995| iso3_d=="FIN" && year>2001| iso3_d=="FRA" && year>1995| iso3_d=="HRV" && year>2023| iso3_d=="HUN" && year>2007| iso3_d=="IRL" && year>2050| iso3_d=="ITA" && year>1997| iso3_d=="LTU" && year>2007| iso3_d=="LUX" && year>1995| iso3_d=="LVA" && year>2007| iso3_d=="MLT" && year>2007| iso3_d=="NLD" && year>1995| iso3_d=="POL" && year>2007| iso3_d=="PRT" && year>1995| iso3_d=="ROU" && year>2050| iso3_d=="SWE" && year>2001| iso3_d=="SVN" && year>2007| iso3_d=="SVK" && year>2007| iso3_d=="GBR" && year>2050
replace schengen_d=0 if schengen_d!=1

gen euro_o=1 if iso3_o=="AUT" && year>1999| iso3_o=="BEL" && year>1999| iso3_o=="BGR" && year>2050| iso3_o=="CYP" && year>2008| iso3_o=="CZE" && year>2050| iso3_o=="DEU" && year>1999| iso3_o=="DNK" && year>2001| iso3_o=="EST" && year>2011| iso3_o=="GRC" && year>2001 | iso3_o=="ESP" && year>1999| iso3_o=="FIN" && year>1999| iso3_o=="FRA" && year>1999| iso3_o=="HRV" && year>2023| iso3_o=="HUN" && year>2050| iso3_o=="IRL" && year>1999| iso3_o=="ITA" && year>1999| iso3_o=="LTU" && year>2015| iso3_o=="LUX" && year>1999| iso3_o=="LVA" && year>2014| iso3_o=="MLT" && year>2008| iso3_o=="NLD" && year>1999| iso3_o=="POL" && year>2050| iso3_o=="PRT" && year>1999| iso3_o=="ROU" && year>2050| iso3_o=="SWE" && year>2050| iso3_o=="SVN" && year>2007| iso3_o=="SVK" && year>2009| iso3_o=="GBR" && year>2050
replace euro_o=0 if euro_o!=1

gen euro_d=1 if iso3_d=="AUT" && year>1999| iso3_d=="BEL" && year>1999| iso3_d=="BGR" && year>2050| iso3_d=="CYP" && year>2008| iso3_d=="CZE" && year>2050| iso3_d=="DEU" && year>1999| iso3_d=="DNK" && year>2001| iso3_d=="EST" && year>2011| iso3_d=="GRC" && year>2001 | iso3_d=="ESP" && year>1999| iso3_d=="FIN" && year>1999| iso3_d=="FRA" && year>1999| iso3_d=="HRV" && year>2023| iso3_d=="HUN" && year>2050| iso3_d=="IRL" && year>1999| iso3_d=="ITA" && year>1999| iso3_d=="LTU" && year>2015| iso3_d=="LUX" && year>1999| iso3_d=="LVA" && year>2014| iso3_d=="MLT" && year>2008| iso3_d=="NLD" && year>1999| iso3_d=="POL" && year>2050| iso3_d=="PRT" && year>1999| iso3_d=="ROU" && year>2050| iso3_d=="SWE" && year>2050| iso3_d=="SVN" && year>2007| iso3_d=="SVK" && year>2009| iso3_d=="GBR" && year>2050
replace euro_d=0 if euro_d!=1

gen schengen=schengen_o*schengen_d
gen euro=euro_o*euro_d
gen wto=wto_o*wto_d
replace wto=0 if wto!=1
gen eu=eu_o*eu_d
replace eu=0 if eu!=1

***************generate origin, destination year fixed effect***************
gen origin_year=iso3num_o*year
gen destination_year=iso3num_d*year


*****************generate logs****************

gen logtrade=log(tradeflow_comtrade_o)  
gen loggdpo=log(gdp_o)
gen loggdpd=log(gdp_d)
gen logdist=log(distw)
gen loggdpcapd=log(gdpcap_d)
gen loggdpcapo=log(gdpcap_o)
gen isood=iso3num_o*1000+iso3num_d
gen logpopo=log(pop_o)
gen logpopd=log(pop_d)

**************panel data setting**************
xtset isood year

************model estimations******************
eststo m1: xtreg logtrade loggdpo loggdpd logpopo logpopd logdist contig comlang_ethno comrelig rta eu wto euro schengen, robust
eststo m2: xtreg logtrade logdist contig comlang_ethno comrelig rta eu wto euro schengen i.origin_year i.destination_year, robust
eststo m3: ppmlhdfe tradeflow_comtrade_o loggdpo loggdpd logpopo logpopd logdist contig comlang_ethno comrelig rta eu wto euro schengen, d
eststo m4: ppmlhdfe tradeflow_comtrade_o logdist contig comlang_ethno comrelig rta eu wto euro schengen, a(iso3num_d#year iso3num_o#year iso3num_d#iso3num_o) d
eststo m5: ppmlhdfe tradeflow_comtrade_o logdist contig comlang_ethno comrelig rta eu wto euro schengen, a(iso3num_d#year iso3num_o#year) cluster(iso3num_d#iso3num_o) d
eststo m6: ppmlhdfe tradeflow_comtrade_o logdist contig comlang_ethno comrelig rta wto, a(iso3num_d#year iso3num_o#year) cluster(iso3num_d#iso3num_o) d
esttab m1 m2 m3 m4 m5 m6 using revision.rtf, label modelwidth(8) indicate("origin year effects= *.origin_year" "destination year effects=*.destination_year" )

predict yhat
gen e1=log(tradeflow_comtrade_o/yhat)
xtline e1, overlay legend(off)

*******use fixed effects to fit observed monadic variables********
regress _ppmlhdfe_d loggdpo loggdpd logpopo logpopd
predict e2



** generate bilateral covariate
replace  comlang_ethno=0 if missing(comlang_ethno)
replace rta=0 if missing(rta)
replace wto=0 if missing(wto)
replace comrelig=0 if missing(comrelig)
gen delta=0.261*comlang_ethno+0.401*comrelig+0.968*comcol+0.613*rta+1.533*wto+e2+e1
replace delta=0 if missing(delta)

****graph the time-varying dyadic variable***********
xtline delta, overlay legend(off)
sort year iso3_o iso3_d

** for the second dataset generate delta variable********
** generate bilateral covariate for TFP equation with 22 countries
keep if iso3_o=="AUT" | iso3_o=="BEL" | iso3_o=="BGR" | iso3_o=="CYP" | iso3_o=="CZE" | iso3_o=="DEU" | iso3_o=="EST" | iso3_o=="GRC" | iso3_o=="ESP" | iso3_o=="FRA" | iso3_o=="HUN" |  iso3_o=="ITA" | iso3_o=="LUX" | iso3_o=="LVA" | iso3_o=="MLT" | iso3_o=="NLD" | iso3_o=="POL" | iso3_o=="PRT" | iso3_o=="ROU" | iso3_o=="SWE" | iso3_o=="SVK" | iso3_o=="GBR"
keep if iso3_d=="AUT" | iso3_d=="BEL" | iso3_d=="BGR" | iso3_d=="CYP" | iso3_d=="CZE" | iso3_d=="DEU" | iso3_d=="EST" | iso3_d=="GRC" | iso3_d=="ESP" | iso3_d=="FRA" | iso3_d=="HUN" |  iso3_d=="ITA" | iso3_d=="LUX" | iso3_d=="LVA" | iso3_d=="MLT" | iso3_d=="NLD" | iso3_d=="POL" | iso3_d=="PRT" | iso3_d=="ROU" | iso3_d=="SWE" | iso3_d=="SVK" | iso3_d=="GBR"


drop if year<2000
drop if year>2013

gen instruments=e2
sort year iso3_o iso3_d


