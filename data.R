#data.R

#problem 1 data
Friend <- c("Ross","Chandler","Joey", "Rachel", "Monica", "Phoeba")
Months <- c(6,12,4,1,2,3,1)
Recovered <-c(0,0,1,0,1,1)
Gender <-c("Male", "Male", "Male", "Female", "Female", "Female")
friends <-cbind(Friend,Months,Recovered,Gender)
colnames(friends) <- c("Friend", "Months", "Recovered", "Gender")

#problem 2 data
file <- "mm.csv"; mm <- read.table(file, header=TRUE, sep=","); 

## clean the data
entry <- as.Date(mm$entrydate,"%m/%d/%y");
last <- as.Date(mm$lastcontactdate,"%m/%d/%y");
death <- as.Date(mm$deathdate,"%m/%d/%y");
os <- as.numeric(last-entry); ## in days
os.i <- as.numeric(!is.na(death)); ## event indicator
mm <- cbind(mm,os.days=os,os.mo=os/365.25*12,os.i); ## in months
write.csv(mm,file="mmdata.csv",row.names=FALSE);
