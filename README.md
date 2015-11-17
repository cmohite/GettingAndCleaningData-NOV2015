# GettingAndCleaningData-NOV2015
Getting And Cleaning Data - Course Project (Peers Assessment)

This repository hosts R script, code-book & output of the script for Course Project of Data Science's Getting And Cleaning Data module. 

The dataset being used is: 

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Script Files

run_analysis.R 

This R script file does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#CodeBook

The codebook.md describes the variables, the data, and transformations performed to clean up the data.

#Running the script

  - Change current directory to directory where run_analysis.R script exists. 
  - Download the data set. The files should be stored to "data/UCI HAR Dataset" difrectory under your working directory    
    (directory where .R script exists).
  - Run Rscript run_analysis.R.
  - The tidy dataset should get created in the current directory as avg.txt.
