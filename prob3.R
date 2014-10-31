# prob3.R
library(KMsurv)
data(burn)

logrank.test.3 <- survdiff(Surv(T3,D3)~factor(Z1),data=burn);
logrank.test.3