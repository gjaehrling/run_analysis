# Code Book project "run_analysis"

## Steps to be performed: 
After loading the initial data, the columns are renamed according to the feature information loaded from file "features.txt". 
The training and test data are merged to one dataset using the rbind command. The columname for the y-train and y-test data are named "activity" and the subject train and test data "subject". 

In step three, the columnames with the mean and standard deviation information are extracted from the second column of the features file using the function sapply and the pattern matching grepl (`sapply(features[,2], function(x) grepl("mean()", x, fixed=T))`).
