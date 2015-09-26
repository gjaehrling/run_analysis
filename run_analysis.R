# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## initial step 0: load packages
library(data.table)
library(dplyr)

## step 1: load the data:
activity_labels <- read.table("activity_labels.txt")[,2]
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
x_train <- read.table("X_train.txt")
x_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

## load the feature information to re-name the columns: 
features <- read.table("features.txt")
colHeader <- features[,2]

## step 2: merge the test and the training data set to one dataset and rename columns:
xTotal <- rbind(x_train, x_test)
colnames(xTotal) <- colHeader
yTotal <- rbind(y_train, y_test)
colnames(yTotal) <- "activity"
subjectTotal <- rbind(subject_train, subject_test)
colnames(subjectTotal) <- "subject"
allData <- cbind(xTotal, yTotal, subjectTotal)

## step 3: extract only the mean and std-deviation
## create a logical vector for columns with mean and standard deviation information:
meanColumns <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
stdColumns <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
## apply the logical vector to the data set to get only mean and std. deviation columns:
tidyData <- allData[, (meanColumns | stdColumns)]

## step 4: rename the activities for better naming
tidyData$activity <- factor(tidyData$activity, labels=activity_labels)
## step 5: grouping the data frame: 
tidyData <- group_by(tidyData, activity, subject)

## get the result from the tidy dataset and create output file in the current working directory:
write.table(tidyData, "ActivitiesTidyDataSet.txt", row.names=FALSE)
