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
  1. Import and and merge dataset using `import.merge.ds()` and store the data into `imported.ds`
  2. Calculate mean and standard deviation using `get.mu.sd()`. This function takes `imported.ds$x` as the input parameter. Returns the calculated data in a dataset and that will be assigned to `x.mu.sd`.
  3. The activities are labled using the data available in the file `activity_labels.txt`, using the funtion `get.name()`, taking `imported.ds$y` as the input data and produces the column  `y.name` as output.
  4. Name the `imported$sub` as the 'Subject'
  5. combine the calculated measurements `x.mu.sd`, activity lables `y.name` and subject data into final dataset suign `cbind()` function.
  6.  Build the tidy dataset using `build.tidy.ds()` funtion, taking `combined` as input and producing `tidy.ds`
  7.  Finally write the data into a csv file using `write.csv()` and taking `tidy.ds` as data.

### Varibables 
#### tidydata()
  1. `imported.ds` : stores the imported data returned by `import.merge.ds()`
  2. `x.mu.sd` : stores the calculated measurements data returned by `get.mu.and.sd()` 
  3. `y.name` : stores the activity names returned by `get.name()`
  4. `combined` : produces one combined data
  5. `tidy.ds` : stores the final tidy dataset

#### import.merge.ds()
  1. `x.train` : Stores data from `X_train.txt`
  2. `y.train` : Stores data from `Y_train.txt`
  3. `subject.train` : Stores data from `subject_test.txt`
  4. `x.test` : Stores data from `X_test.txt`
  5. `y.test` : Stores data from `Y_test.txt`
  6. `subject.test` : Stores data from `subject_train.txt`
  7. `merged.x` : Stores merged data of `x.train` and `x.test`
  8. `merged.y` : Stores merged data of `y.train` and `y.test`
  9. `merged.subject` : Stores merged data of `subject.train` and `subject.test`




