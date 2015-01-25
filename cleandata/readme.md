<i>This repository is for the project of Getting and cleaning the data.<i>

##Problem Statement
###INPUT:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
###OUTPUT:
  Tidy_UCI_HAR.csv (processed CSV file in a clean format, which can be used for further processing)
###Requiremnt:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

###Assumption:
  1. The data is downloaded, unzipped and kept in the present working directory of R under folder 'UCI HAR Dataset '
  2. Change the directory path in the  first line of the code to your present working directory

##Program Walkthrought 
###Functions
  1. tidydata
  2. import.merge.ds
  3. get.mu.and.sd
  4. get.name
  5. build.tidy.ds

### tidydata()
### import.merge.ds()
### get.mu.and.sd()
Parameters: xdat : data of 'X' related colums
### get.name()
Parameters: ydat : data of 'Y' realted colums for adding activities
### build.tidy.ds()
parameters: ds : the final dataset 

