# run_analysis.R

setwd("C:/Documents and Settings/Al/My Documents/R/DataSci_Courses/Get_Clean_data/Project")
getwd()

require(data.table)
require(reshape2)

# read data from test and training sets plus activity labels and subject identifiers
testX <- read.table("./UCI_Dataset/X_test.txt",
                    comment.char = "", colClasses="numeric")
testX2 <- cbind(testX,(fread("./UCI_Dataset/y_test.txt")))
testX3 <- cbind(testX2,(fread("./UCI_Dataset/subject_test.txt")))

trainX <- read.table("./UCI_Dataset/X_train.txt",
                     comment.char = "", colClasses="numeric")
trainX2 <- cbind(trainX,(fread("./UCI_Dataset/y_train.txt")))
trainX3 <- cbind(trainX2,(fread("./UCI_Dataset/subject_train.txt")))

# combine test and training sets
allX <- rbind(testX3,trainX3)

# read features (variables) set
myfeatures <- read.table("./UCI_Dataset/features.txt",
                         comment.char = "", colClasses="character")
# Add column names for "activity" and "subject" to features set
myf2 <- rbind(myfeatures,c("562","activity"))
myf2 <- rbind(myf2,c("563","subject"))

# set features as column names
colnames(allX) <- myf2[,2]
# colnames(allX) <- tolower(colnames(allX))

# select columns for means, std. deviations, activity and subject 
names2 <-as.numeric(grep("mean|std|activity|subject",myf2[,2]))
allX2 <- allX[,names2]

#remove "()" from column names
names(allX2) <- gsub("\\()", "", names(allX2))
# change "-" to "." in column names
names(allX2) <- gsub("\\-", ".", names(allX2))

# ensure that I.D. variables are factors
allX2$activity <- as.factor(allX2$activity)
levels(allX2$activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
allX2$subject <- as.factor(allX2$subject)

# create summary of averages of variables
allMelt <- melt(allX2,id = c("activity", "subject"),measure.vars= names(allX2[1:79]))
DataSum <- dcast(allMelt, activity + subject ~ variable,mean)
