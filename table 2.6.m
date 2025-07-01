


%% find the optimal alpha which maximize the loglikelihood function
results=saralpha(y,x,w,N,T,info);


%% define dependent and indepedent variables
lnw=reshape(log(wage),[N*T,1]);
lnl=reshape(log(laborad),[N*T,1]);
lny=reshape(log(gva),[N*T,1]);
lnk=reshape(log(capital),[N*T,1]);
lns=reshape(log(patent),[N*T,1]);
wlns=resultsw.w*lns;
y=lny;

%% estimate model 1-5
%% model 1
vnames=strvcat('logy','intercept','logk','logl');
info.model=0;
results1=panelfixed(y,x,N,T,wc,info,vnames);

%% model 2
vnames=strvcat('logy','intercept','logk','logl');
info.model=1;
results1=panelfixed(y,x,N,T,wc,info,vnames);

%% model 3


%% model 3 CCE estimation

ybar=kron(mean(log(gva(:,1:T)),1),ones(1,N))';

%% estimate model 6-15
%% model 6
x6=[lnk lnl];
results6=sar_panel_FE(y,x6,wc,T,info);
aadf6=aadf(reshape(results6.resid,[N,T])',N);

%%model 8 and 11
results8=sar_panel_FE(y,[lnk lnl],Walpha,T,info);
results11=sem_panel_FE(y,[lnk lnl],Walpha,T,info);

%% model 9 and 12
%% redefine dependent and independent variables
%% T=23;
lnl=reshape(log(laborad(:,1:23)),[N*T,1]);
lny=reshape(log(gva(:,1:23)),[N*T,1]);
lnk=reshape(log(capital(:,1:23)),[N*T,1]);
lns=reshape(patent(:,1:23),[N*T,1]);
y=lny;
x=[lnk lnl lns];
results9=sar_panel_FE(y,[lnk lnl lns],Walpha,T,info);
results11=sem_panel_FE(y,[lnk lnl lns],Walpha,T,info);

%% model 10 and 13

results9=sar_panel_FE(y,[lnk lnl lns wlns],Walpha,T,info);
results11=sem_panel_FE(y,[lnk lnl lns wlns],Walpha,T,info);

%% J-test between model 8 and 11, 
resid11=reshape(results11.resid,[N,T]);
Resid11=resid11-kron(mean(resid11,2),ones(1,T));
resultJ8=sar_panel_FE(y,[lnk lnl y-reshape(Resid11,[N*T,1])],Walpha,T,info);
resultJ11=sar_panel_FE(y,[lnk lnl y-results8.resid],Walpha,T,info);


%% J-test between model 9 and 12, 
resid11=reshape(results11.resid,[N,T]);
Resid11=resid11-kron(mean(resid11,2),ones(1,T));
resultJ8=sar_panel_FE(y,[lnk lnl y-reshape(Resid11,[N*T,1])],Walpha,T,info);
resultJ11=sar_panel_FE(y,[lnk lnl y-results8.resid],Walpha,T,info);

%% Generate weight matrix of selected units
wdpatent=walphad*patent;
ww=(eye(N*T)-0.506*resultswtrade.wt)^(-1);
ts=ww-diag(diag(ww));
D2=reshape(sum(ts),[N,T]);
resultsp2=powerlaw(D2,10);
T=23;

Walphad=zeros(N,N);
for i=1:10
Walphad(:,ndominant(i))=Walpha(:,ndominant(i));
end

for i=1:N
    walphad(i,:)=Walphad(i,:)/sum(Walphad(i,:));
end
    
Walphaw=Walpha;
for i=1:10
Walphaw(:,ndominant(i))=zeros(N,1);
end

for i=1:N
    walphaw(i,:)=Walphaw(i,:)/sum(Walphaw(i,:));
end
lnl=reshape(log(laborad(:,1:23)),[N*T,1]);
lny=reshape(log(gva(:,1:23)),[N*T,1]);
lnk=reshape(log(capital(:,1:23)),[N*T,1]);
lns=reshape(patent(:,1:23),[N*T,1]);

%% generate meant variables
lbar=kron(mean(log(laborad(:,1:T)),1),ones(1,N))';
ybar=kron(mean(log(gva(:,1:T)),1),ones(1,N))';
kbar=kron(mean(log(capital(:,1:T)),1),ones(1,N))';

wdpatent=walphad*patent;
dlns=reshape(wdpatent(:,1:23),[N*T,1]);
wwpatent=walphaw*patent;
wwlns=reshape(wwpatent(:,1:23),[N*T,1]);
x=[lnk lnl lns dlns wwlns];
y=lny;
