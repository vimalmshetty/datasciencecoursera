# Introduction

The script `run_analysis.R` psuedocode 
- downloads the data from
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- merges the training and test sets to create one data set
- replaces `activity` values in the dataset with descriptive activity names
- extracts only the measurements (features) on the mean and standard deviation
  for each measurement
- appropriately labels the columns with descriptive names
- creates a second, independent tidy dataset with an average of each variable
  for each each activity and each subject. In other words, same type of
  measurements for a particular subject and activity are averaged into one value
  and the tidy data set contains these mean values only. The processed tidy data
  set is also exported as csv file.
  

## Getting and cleaning data:
The script `run_analysis.R` script contains the following functions
### tidydata()
  This function works as the main function calls all the other function. Steps are as follows:
    1. Import and and merge dataset using `import.merge.ds()`
    2. Calculate mean and standard deviation using `get.mu.sd()`. This function takes `imported.ds$x` as the input parameter. Returns the calculated data in a dataset and that will be assigned to `x.mu.sd`.
    3. 
### import.merge.ds()
### get.mu.and.sd()
Parameters: xdat : data of 'X' related colums
### get.name()
Parameters: ydat : data of 'Y' realted colums for adding activities
### build.tidy.ds()
parameters: ds : the final dataset 

