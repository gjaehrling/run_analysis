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
