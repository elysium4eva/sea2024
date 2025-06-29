%%% create time series plots of powerlaw coefficients by various methods
%% calculate the technological multiplier
ww=(eye(N*T)-0.416*resultswtrade.wt)^(-1);
ts=ww-diag(diag(ww));
D=reshape(sum(ts),[N,T]);
R=mean(D,2);
%% least dominant region
Rmin=min(R);
Rmax=max(R);
%% plot the PL estimates of techonological multiplier
resultspl=powerlaw(D,10);



plot(year,resultspl.beta_GI(:,1),'-o',year,resultspl.beta_GI(:,2),'-+',year,resultspl.beta_GI(:,3),'-*',year,1./resultspl.dextremum,'--');
legend;
plot(year,resultspl.beta_mle(:,1),'-o',year,resultspl.beta_mle(:,2),'-+',year,resultspl.beta_mle(:,3),'-*');
legend;