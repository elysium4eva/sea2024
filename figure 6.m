%% step 1 create endogenous weight matrix
%% reshape the gdp and gdp per capital in origin and destination regions
%% create endogenous weight matrix by trade gravity model 1
%% Wd,Wc,wl are distance, contiguity, language proximity matrix respectively
resultswtrade=tradeflowr(delta,log(gdp),log(gdp),log(pop),log(pop),[0.685 0.548 0.204 0.184 -1.1 0.146],-9.659,noc,Wd,Wc,1.744);
border=1.744;


%% create contral variable for stata regressions
XX=nationtoregion(delta,noc,border);
control=reshape(squeeze(sum(XX,1)),[N*T,1]);





%% create inverse distance matrix by the power of alpharesult
Walpha=distance(coordinates,alpharesult);
%% define dependent and indepedent variables
y=reshape(log(tfp),[N*T,1]);
hrr=reshape(hr*1000./pop,[N*T,1]);
lns=reshape(log(patent),[N*T,1]);
ed=reshape(edu/100,[N*T,1]);
wlns=resultswtrade.wt*lns;
wlns1=reshape(Walpha*log(patent),[N*T,1]);
wlntfp=log(resultswtrade.wt*reshape(tfp,[N*T,1]));
lnapp=reshape(log(app+ones(N,T)),[N*T,1]);
wlnapp=resultswtrade.wt*lnapp;
wwlntfp=resultswtrade.wt*wlntfp;
whrr=resultswtrade.wt*hrr;
wed=resultswtrade.wt*ed;
lncontrol=reshape(control,[N*T,1]);


%% create stata regression variables IVs
wdlnapp=reshape(Walpha*log(app+ones(N,T)),[N*T,1]);
wdwdlnapp=reshape(Walpha*Walpha*log(app+ones(N,T)),[N*T,1]);
wclnapp=reshape(Wc*log(app+ones(N,T)),[N*T,1]);
wcwclnapp=reshape(Wc*Wc*log(app+ones(N,T)),[N*T,1]);

wwlntfp=resultswtrade.wt*wlntfp;
whrr=resultswtrade.wt*hrr;
wed=resultswtrade.wt*ed;
lncontrol=reshape(control,[N*T,1]);

[m,n]=size(theta);
Theta=ones(theta(1,1),1)*theta(1,2);
for i=2:m
Theta=[Theta
    ones(theta(i),1)*theta(i,2)];
end
TTheta=kron(ones(T,1),Theta);


%% calculate the technological multiplier
ww=Theta.*resultswtrade.wt;
ts=ww-diag(diag(ww));
D=reshape(sum(ts),[N,T]);
R=mean(D,2);
%% least dominant region
Rmin=min(R);
Rmax=max(R);


%% plot the PL estimates of techonological multiplier
resultspl=powerlaw(D,10);

%% generate year variable
year=2000:1:2013

plot(year,resultspl.beta_GI(:,1),'-o',year,resultspl.beta_GI(:,2),'-+',year,resultspl.beta_GI(:,3),'-*',year,1./resultspl.dextremum,'--');
legend;
plot(year,resultspl.beta_mle(:,1),'-o',year,resultspl.beta_mle(:,2),'-+',year,resultspl.beta_mle(:,3),'-*',year,1./resultspl.dextremum,'--');
legend;

