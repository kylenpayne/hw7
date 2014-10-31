#prob2.R

#load in the local dependencies
if(!exists("mm")) source("data.R")

library(survival)

# use only the TT2 subset of the data.
mm.TT2 <- mm[mm$PROT == "TT2",]
mm.TT2$group <- ifelse(mm.TT2$rs70 <= 0.66, 1, 0)

logrank.test.2 <- survdiff(Surv(os.mo,os.i)~factor(group),data=mm.TT2);
logrank.test.2

covariates<-c("AGE","SEX","RACE","ISOTYPE","Cyto.Abn")

uni.cov.tests<-apply(mm.TT2[,covariates], 2, function(x){
  survdiff(Surv(os.mo,os.i)~x,data=mm.TT2)
})


survdiff(Surv(os.mo,os.i)~I(AGE),data=mm.TT2)

plot(survfit(Surv(os.mo,os.i)~factor(group),data=mm.TT2),lty=1:4,
     main="Overall survival",
     xlab="Time (Months)",ylab="Probability");
legend("topright",c("Group 1", "Group 2"),
       lty=1:4,bty="n");
text(0,0,"p=1.25x10^-14",pos=4);