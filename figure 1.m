%% defactor lntfp
dmg=lntfp-kron(ones(N,1),mean(lntfp,1));
plot(dmg');
%% calculate correlation indicators
%% this command requires MT function from Bailey, Holly and Pesaran (2015)
resultswww=MT(dmg,0.95,2);
%% calculate frequencies of significant correlation pairs (positive and negative)
d=sum(resultswww.wp);
histogram(d);
d2=sum(resultswww.wn);
histogram(d2);
histogram(resultswww.wp)
%% plot double histogram
doublehist(d, d2);