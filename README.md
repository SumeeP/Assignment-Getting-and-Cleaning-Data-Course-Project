### Assignment-Getting-and-Cleaning-Data-Course-Project

#### Purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#### Data description
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#### To Do
Create one R script called _run_analysis.R_ that does the following  
  
  1. Merges the training and the test sets to create one data set.<br\>
  
  _: it is done by means of "cbind" and "rbind" for test and training data sets_
  
  2. Extracts only the measurements on the mean and standard deviation for each measurement.<br\>
  
  _: it is done using "grep"_
  
  3. Uses descriptive activity names to name the activities in the data set <br\>
  
  _: it is done using "factor" (levels and labels definition)_
  
  4. Appropriately labels the data set with descriptive variable names.<br\>
  
  _:it is done using "grep" and "colnames"_
  
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity   and each subject.<br\>
  
  _: it is done using "group_by", "summarise_all" of dplyr package_
