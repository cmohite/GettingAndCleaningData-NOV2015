## Getting An Cleaning Data - CodeBook
Author - Chetan Mohite

### Description

This document contains information about the variables, the data, and the transformations used to clean up the data.

### Source Data & Data Set information

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The dataset includes the following files:
=========================================
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': 
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': 
The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': 
The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': 
The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

###Attribute Information:

For each record in the data-set it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####features_info.txt  

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

####activity_labels.txt  
This file stores mappings between Activity Id & it's description:

	Activity Id	Activity Label			
		1 	WALKING
		2 	WALKING_UPSTAIRS
    3 	WALKING_DOWNSTAIRS
    4 	SITTING
		5 	STANDING
		6	  LAYING

####X_train.txt
This file stores training data set. 

Each column in this file denotes data for corresponding row (feature) given in features.txt file. E.g. The first column contains data for 1 tBodyAcc-mean()-X
, which is first row in fearues.txt; second column contains data for tBodyAcc-mean()-Y, which is second row in features.txt file and so on.

Each row in this file denotes data for a particular activity (WALKING, WLAKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING
, LAYING). This mapping is stored in y_train.txt file. 

####y_train.txt
This file stores activity ids for each row in X_train.txt. E.g. The first value in y_train is 5, which is STANDING (please refer to activity_labels.txt). 

##X_test.txt
This file stores test data set. 

Each column in this file denotes data for corresponding row (feature) given in features.txt file. E.g. The first column contains data for 1 tBodyAcc-mean()-X
, which is first row in fearues.txt; second column contains data for tBodyAcc-mean()-Y, which is second row in features.txt file and so on.

Each row in this file denotes data for a particular activity (WALKING, WLAKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING
, LAYING). This mapping is stored in y_test.txt file. 

####y_test.txt
This file stores activity ids for each row in X_test.txt. E.g. The first value in y_test is 5, which is STANDING (please refer to activity_labels.txt). 

###Transformation Details

* Reads Activity Labels & Features details into R
	- features <- features.txt 
	- activity_labels <- activity_labels.txt
* Reads Training data-set details into R 
	- X_train <- X_train.txt
	- y_train <- y_train.txt
	- subject_train <- subject_train.txt
* Reads Test data-set details into R 
	- X_test <- X_test.txt
	- y_test <- y_test.txt
	- subject_test <- subject_test.txt
* Assigns descriptive Column headers to test & train data loaded into R using features data.
* Merges subjects (subject_train & subject_test) into one dataframe called subjects & assigns descriptive column header - SubjectID to it. 
* Extracts data for columns related to only required mesaurements - mean and std from train & test dataframes & merges them into one dataframe called Xs.
* Merges training & test labels data (y_train & y_test) into one dataframe called Ys & assigns descriptive column header - ActivityID to it. 
* Merges Subjects (subjects), Test & Train (Xs & YS) data into one dataframe called merged_data.
* Assigns descriptive names to Activity Ids in merged_data from activity_labels data loaded into R.
* Groups data in merged_data dataframe for each ActivityID & each SubjectID & calculates the average for rest of the data columns. 
* Writes average data into a text file called avg.txt.
