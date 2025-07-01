

**********create time invariant variable list***********
vl create time_invariant = (basiceducation distance efficiency health infrastructure innovation institutions labormarketefficiency language macroeconomicstability rci2019 relativew religion spoken technologicalreadiness)

******table 4 tfp 2sls******
eststo m1: ivregress 2sls lntfp hrr lns wlns  $time_invariant i.year  
predict e1, resid
xtcse2 e1


eststo m2: ivregress 2sls lntfp hrr lns wlns  i.ID i.year 
predict e2, resid
xtcse2 e2


eststo m3: ivregress 2sls lntfp hrr i.ID i.year (lns = lnapp wclnapp)
estat endogenous
estat overid
predict e3, resid
xtcointtest pedroni lntfp hrr lns wlns
xtcse2 e3


eststo m4: ivregress 2sls lntfp lns immirate hrr c.immirate#c.hrr control i.ID (wlns = wlnapp wwlnapp)
estat endogenous
estat overid
predict e4, resid
xtcointtest pedroni lntfp lns immirate hrr c.immirate#c.hrr control
xtcse2 e4


eststo m5: ivregress 2sls lntfp  hrr control i.ID (lns i.Country#c.wlns = lnapp i.Country#c.wlnapp)
testparm i.Country#c.wlns
predict e5, resid
xtcse2 e5

eststo m6: ivregress 2sls lntfp  hrr control i.ID (i.Country#c.lns i.Country#c.wlns = i.Country#c.lnapp i.Country#c.wlnapp)
testparm i.Country#c.lns
testparm i.Country#c.wlns
predict e6, resid
xtcse2 e6

eststo m7: ivregress 2sls lntfp immirate hrr c.immirate#c.hrr control i.ID (lns i.Country#c.wlns = lnapp i.Country#c.wlnapp)
testparm i.Country#c.wlns
predict e7, resid
xtcse2 e7

esttab m1 m2 m3 m4 m5 m6 m7 using finalmain.rtf, keep(lns wlns  immirate hrr c.immirate#c.hrr immirate control)

esttab m1 m2 m3 m4 m5 m6 m7 using finalextension1.rtf, keep(1bn.Country#c.wlns 2.Country#c.wlns 3.Country#c.wlns  4.Country#c.wlns 5.Country#c.wlns 6.Country#c.wlns 7.Country#c.wlns 8.Country#c.wlns 9.Country#c.wlns 11.Country#c.wlns 12.Country#c.wlns 13.Country#c.wlns 14.Country#c.wlns 15.Country#c.wlns 16.Country#c.wlns 17.Country#c.wlns 18.Country#c.wlns 19.Country#c.wlns 20.Country#c.wlns 21.Country#c.wlns 22.Country#c.wlns 23.Country#c.wlns)

esttab m1 m2 m3 m4 m5 m6 m7 using finalextension2.rtf, keep(1bn.Country#c.lns 2.Country#c.lns 3.Country#c.lns  4.Country#c.lns 5.Country#c.lns 6.Country#c.lns 7.Country#c.lns 8.Country#c.lns 9.Country#c.lns 11.Country#c.lns 12.Country#c.lns 13.Country#c.lns 14.Country#c.lns 15.Country#c.lns 16.Country#c.lns 17.Country#c.lns 18.Country#c.lns 19.Country#c.lns 20.Country#c.lns 21.Country#c.lns 22.Country#c.lns 23.Country#c.lns)