###R-Assignment

library(data.table)
library(dplyr)
library(tidyr)

setwd("mycomputer/") # my computer folder
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"Dataset.zip" )
unzip("Dataset.zip") 

feature         <-read.table("UCI HAR Dataset/features.txt")
activity.label  <-read.table("UCI HAR Dataset/activity_labels.txt")

test.df                 <- read.table("UCI HAR Dataset/test/X_test.txt")
test.df.activity        <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject            <- read.table("UCI HAR Dataset/test/subject_test.txt")

train.df                <- read.table("UCI HAR Dataset/train/X_train.txt")
train.df.activity       <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subject           <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Merges the training and the test sets to create one data set.
test.df$Category        <-rep("test",2947) # it is not requried in this project
test                    <-cbind(test.df,test.df.activity,test.subject)

train.df$Category        <-rep("train",7352)# it is not requried in this project
train                   <-cbind(train.df,train.df.activity,train.subject)

total.df <- rbind(test,train)


#Extracts only the measurements on the mean and standard deviation for each measurement.
mean.std <- grep("*.mean.*|*.std.*",feature$V2)
total.df.m.std <- total.df[,mean.std]

#Appropriately labels the data set with descriptive variable names.

colnames(total.df.m.std) <- feature[mean.std,2] 
total.df.m.std$activity <-total.df[,563]
total.df.m.std$subject <-total.df[,564]


#Uses descriptive activity names to name the activities in the data set
total.df.m.std$activity <- factor(total.df.m.std$activity, levels = activity.label[,1], labels = activity.label[,2])


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy.df <- total.df.m.std %>% group_by(activity,subject)%>%summarise_all(mean)%>%arrange(activity,subject)
write.table(tidy.df,"tidy.txt", col.names = TRUE)




