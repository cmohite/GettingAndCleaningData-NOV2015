#Set current working directory
setwd("D:\\Applcation-Docs-Src\\SelfStudy\\Coursera\\RProgramming\\GettingAndCleaningData\\Assignment\\UCI HAR Dataset")

#Load activity labels into memory
activity_lables <- read.table("./activity_labels.txt")

#Load features into memory
features <- read.table("./features.txt")

#Load Train Data into memory
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#Assign column labels from features to train data
col_headers <- features[,2]
names(X_train) <- col_headers

#Load Test Data into memory
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#Assign column labels from features to test data
names(X_test) <- col_headers

#Get Columns relate to only mean and std
mean_or_std <- grep("mean\\(\\)|std\\(\\)", col_headers)

#Merge Train & Test data.
subjects <- rbind(subject_train, subject_test)
names(subjects) <- "SubjectID"
Xs <- rbind(X_train[,mean_or_std], X_test[,mean_or_std])
Ys <- rbind(y_train, y_test)
names(Ys) <- "ActivityID"
merged_data <- cbind(subjects, Ys, Xs)


#Assign descriptive names to ActivityIDs
merged_data$ActivityID <- factor(merged_data$ActivityID, labels=activity_lables[,2]) 

#GroupBy each ActivityID & each SubjectID
by_subject_activity <- group_by(merged_data, ActivityID, SubjectID)
result <- summarise_each(by_subject_activity, funs(mean))

# Write Avergare values for each activity and each subject to file
write.table(result, file="./avg.txt", sep="\t", row.names=FALSE)

