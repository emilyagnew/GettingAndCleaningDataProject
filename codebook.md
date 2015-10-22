---
title: "Codebook for Getting and Cleaning Data Course Project"
author: "eagnew"
---

## Project Description
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Using accelerometers and gyroscopes, the data captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

##Data processing
The original dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

###Collection of the raw data
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Creating the tidy datafile

###Guide to create the tidy data file
 - download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 - save in directory
 - set to same directory in run_analysis.R
 - run run_analysis.R (this creates tidy_dataset.txt)

###Cleaning of the data
The cleaning file performs the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Description of the variables in the tidy_dataset.txt file
68 variables, 180 observations (68 columns, 180 rows)
Variables:
 - id: (integer) participant number (1:30)
 - activity: (factor) participants' activity while measurement was taken (e.g. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

 - All other: (numeric) Signals were used to estimate variables of the feature vector for each activity:
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 'mean' denotes the mean value and 'std' denotes the standard deviation, for the following measurements:

 -- tBodyAcc-XYZ
 -- tGravityAcc-XYZ
 -- tBodyAccJerk-XYZ
 -- tBodyGyro-XYZ
 -- tBodyGyroJerk-XYZ
 -- tBodyAccMag
 -- tGravityAccMag
 -- tBodyAccJerkMag
 -- tBodyGyroMag
 -- tBodyGyroJerkMag
 -- fBodyAcc-XYZ
 -- fBodyAccJerk-XYZ
 -- fBodyGyro-XYZ
 -- fBodyAccMag
 -- fBodyAccJerkMag
 -- fBodyGyroMag
 -- fBodyGyroJerkMag