# Code Book project "run_analysis"

## Steps to be performed: 
After loading the initial data, the columns are renamed according to the feature information loaded from file "features.txt". 
The training and test data are merged to one dataset using the rbind command. The columname for the y-train and y-test data are named "activity" and the subject train and test data "subject". 

In step three, the columnames with the mean and standard deviation information are extracted from the second column of the features file using the function sapply and the pattern matching grepl: 
`sapply(features[,2], function(x) grepl("mean()", x, fixed=T))`

This logical vector is applied to the data set to get only mean and standard deviation columns forming the tidy data set:
`tidyData <- allData[, (meanColumns | stdColumns)]`

For better readability of the activities, the factor variable with the activity labels is replacing the column activity of the tidy data set:
`tidyData$activity <- factor(tidyData$activity, labels=activity_labels)`

In the last step four, the result from the tidy dataset is exracted as en create output file in the current working directory using the following command:
`write.table(tidyData, "ActivitiesTidyDataSet.txt", row.names=FALSE)`

# Variables: 
in total, 10299 observations ov 68 variables are in the data-set. The variables for mean and standard deviation are represented as numeric variables. The activity variable is a factor with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and the subject varialbe is represented as integer. 

The following variables are extracted in the tidyData set:

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y          
- tBodyAcc-mean()-Z       
- tBodyAcc-std()-X 
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z 
- tGravityAcc-mean()-X  
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z 
- tGravityAcc-std()-X 
- tGravityAcc-std()-Y 
- tGravityAcc-std()-Z 
- tBodyAccJerk-mean()-X 
- tBodyAccJerk-mean()-Y 
- tBodyAccJerk-mean()-Z 
- tBodyAccJerk-std()-X 
- tBodyAccJerk-std()-Y 
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X  
- tBodyGyro-mean()-Y 
- tBodyGyro-mean()-Z 
- tBodyGyro-std()-X  
- tBodyGyro-std()-Y 
- tBodyGyro-std()-Z 
- tBodyGyroJerk-mean()-X   
- tBodyGyroJerk-mean()-Y  
- tBodyGyroJerk-mean()-Z  
- tBodyGyroJerk-std()-X 
- tBodyGyroJerk-std()-Y 
- tBodyGyroJerk-std()-Z 
- tBodyAccMag-mean()  
- tBodyAccMag-std()  
- tGravityAccMag-mean() 
- tGravityAccMag-std()  
- tBodyAccJerkMag-mean() 
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()  
- tBodyGyroMag-std() 
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std() 
- fBodyAcc-mean()-X 
- fBodyAcc-mean()-Y 
- fBodyAcc-mean()-Z 
- fBodyAcc-std()-X 
- fBodyAcc-std()-Y 
- fBodyAcc-std()-Z 
- fBodyAccJerk-mean()-X 
- fBodyAccJerk-mean()-Y 
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X 
- fBodyAccJerk-std()-Y 
- fBodyAccJerk-std()-Z  
- fBodyGyro-mean()-X 
- fBodyGyro-mean()-Y  
- fBodyGyro-mean()-Z  
- fBodyGyro-std()-X 
- fBodyGyro-std()-Y 
- fBodyGyro-std()-Z 
- fBodyAccMag-mean() 
- fBodyAccMag-std() 
- fBodyBodyAccJerkMag-mean() 
- fBodyBodyAccJerkMag-std() 
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std() 
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-std()
- activity 
- subject  
