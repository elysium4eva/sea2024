%% create regional trade flow matrix with endogenous variables
%% step 1 create endogenous weight matrix
%% reshape the gdp and gdp per capital in origin and destination regions
Gdp=reshape(gdp,[N*T,1]);
Gdppercap=reshape(gdppercap,[N*T,1]);
%% create endogenous weight matrix by trade gravity model 1
%% delta is the composed bilateral variables from international regressions using stata
%% Wd,Wc,wl are distance, contiguity, language proximity matrix respectively
resultswtrade=tradeflowr(delta,log(gdp),log(gdp),log(pop),log(pop),[0.685 0.548 0.204 0.184 -1.1 0.146],-9.659,noc,Wd,Wc,1.744);


%% create histogram of regional trade flow matrix outdegree in figure 2
histogram(resultswtrade.d(1,:));
hold on
histogram(resultswtrade.d(29,:));
legend;