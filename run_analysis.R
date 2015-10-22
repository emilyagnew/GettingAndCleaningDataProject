## COURSE PROJECT 1 

# clear the workspace
rm(list = ls())
# set working directory
setwd("UCI HAR Dataset")

## Reads in datasets
# subject = 1:30 - id for each of the 30 volenteers
# y = 1:6 - 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING
# x = 1:561 - see features file for list of variables

subject_test <- read.table("test/subject_test.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
Y_test <- read.table("test/Y_test.txt", header = FALSE)

subject_train <- read.table("train/subject_train.txt", header = FALSE)
X_train <- read.table("train/X_train.txt", header = FALSE)
Y_train <- read.table("train/Y_train.txt", header = FALSE)

## 1) Merges the training and the test sets to create one data set.
test<-data.frame(subject_test,Y_test,X_test)
train<-data.frame(subject_train,Y_train,X_train)

combined<-rbind(test,train)
combined<-combined[order(combined$V1,combined$V1.1), ]

## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
feat<-read.table("features.txt")
# included all variables with both a mean and std measure
var_num_mn<-grep("-mean()",feat$V2,fixed=TRUE)
var_num_sd<-grep("-std()",feat$V2,fixed=TRUE)
var_num<-sort(rbind(var_num_mn,var_num_sd))
var_num_v<-paste0("V",var_num)

library(dplyr)
combined_l<-rename(combined, id=V1)
combined_l<-rename(combined_l, activity=V1.1)
combined_l<-rename(combined_l, V1=V1.2)

combined_mn_sd<-combined_l[, c("id", "activity", (var_num_v))]

## 3) Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
combined_mn_sd$activity <- activity_labels$V2[combined_mn_sd$activity]

## 4) Appropriately labels the data set with descriptive variable names. 
labels_mn_sd<-feat$V2[var_num]
labels_mn_sd<-gsub("\\()","", labels_mn_sd)
labels_mn_sd<-gsub("-","", labels_mn_sd)

library(data.table)
setnames(combined_mn_sd, old=var_num_v, new=labels_mn_sd)

## 5) From the data set in step 4, creates a second, independent tidy data set 
##      with the average of each variable for each activity and each subject.
tidy_combined<-aggregate(combined_mn_sd[3:68], by=list(combined_mn_sd$id, combined_mn_sd$activity), FUN=mean)
tidy_combined<-rename(tidy_combined, id=Group.1)
tidy_combined<-rename(tidy_combined, activity=Group.2)
write.table(tidy_combined, file = "tidy_dataset.txt", row.name=FALSE)
