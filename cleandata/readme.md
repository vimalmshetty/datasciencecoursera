<i>This repository is for the project of Getting and cleaning the data. This file explains how 'run_analysis.R' script works<i>

##Problem Statement
###INPUT:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
###OUTPUT:
  `Tidy_UCI_HAR.csv` (processed CSV file in a clean format, which can be used for further processing)
###Requiremnt:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

###Assumption:
  1. The data is downloaded, unzipped and kept in the present working directory of R under folder `UCI HAR Dataset`
  2. Change the directory path in the  first line of the code to your present working directory

##Program Walkthrought 
###Functions
The `run_analysis.R` contains the following functions, `tidydata()` acts as main funtion calling different functions performing the one of the specific funtion metioned in the requirements.
  1. tidydata
  2. import.merge.ds
  3. get.mu.and.sd
  4. get.name
  5. build.tidy.ds

### Getting and cleaning process
The programme assumes that the data is downloaded and kept unde the directory `UCI HAR Dataset` under the present working directory.

The first step of the preprocessing is to merge the training and test sets. Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier). After the merge operation the resulting data, the table contains 562 columns (560 measurements, subject identifier and activity label).

After the merge operation, mean and standard deviation features are extracted for further processing. Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted, yielding a data frame with 68 features (additional two features are subject identifier and activity label).

Next, the activity labels are replaced with descriptive activity names, defined in `activity_labels.txt` in the original data folder.

The final step creates a tidy data set with the average of each variable for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 66 columns. The tidy data set is exported to `TIDY_UCI_HAR.csv` where the first row is the header containing the names for each column.


