#Author: Vimal Kumar M
#Date : 25.01.2015
#The purpose of the scirpt is to produce a clean data set using the UCI HAR DATASET

#Set the current working directory to the directory contraining the folder UCI HAR DATASET.
setwd("G:/vimal/data science/JHU/DATACLEANING/project");

library(plyr);

#import the different data from file under UCI DHAR DATASET and merge them in to one dataset
import.merge.ds= function(){
  #Reading Dataset training
  message("importing X_train.txt")
  x.train <- read.table("UCI HAR Dataset/train/X_train.txt")
  message("importing y_train.txt")
  y.train <- read.table("UCI HAR Dataset/train/y_train.txt")
  message("importing subject_train.txt")
  subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  
  #Reading Dataset Test
  message("importing X_test.txt")
  x.test <- read.table("UCI HAR Dataset/test/X_test.txt")
  message("importing y_test.txt")
  y.test <- read.table("UCI HAR Dataset/test/y_test.txt")
  message("importing subject_test.txt")
  subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  
  #merge Training and Text
  merged.x <- rbind(x.train, x.test);
  merged.y <- rbind(y.train, y.test);
  merged.subject <- rbind(subject.train, subject.test);
  
  # merge x, Y and subject
  list(x=merged.x, y=merged.y, subject=merged.subject);
}


get.mu.and.sd = function(xdat){
  # Read the feature list file
  features <- read.table("UCI HAR Dataset/features.txt")
  # Find the mean and std columns
  mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
  std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
  # Extract them from the data
  exdat <- xdat[, (mean.col | std.col)]
  colnames(exdat) <- features[(mean.col | std.col), 2]
  exdat
}

get.name = function(ydat){
  # Use descriptive activity names to name the activities in the dataset
  colnames(ydat) <- "activity"
  ydat$activity[ydat$activity == 1] = "WALKING"
  ydat$activity[ydat$activity == 2] = "WALKING_UPSTAIRS"
  ydat$activity[ydat$activity == 3] = "WALKING_DOWNSTAIRS"
  ydat$activity[ydat$activity == 4] = "SITTING"
  ydat$activity[ydat$activity == 5] = "STANDING"
  ydat$activity[ydat$activity == 6] = "LAYING"
  ydat
} 

build.tidy.ds = function(ds){
  #produce the final tidy data set
  tidy <- ddply(ds, .(subject, activity), function(x) colMeans(x[,1:60]))
  tidy
}

tidydata  = function(){
  
  #import datset and merge
  imported.ds <-import.merge.ds();
  #calculate the mean and standard deviation
  x.mu.sd <- get.mu.and.sd(imported.ds$x);
  #lable the activities
  y.name <- get.name(imported.ds$y);
  #name the column name of subject
  colnames(imported.ds$sub) <- c("subject");
  #combine the datasets
  combined <- cbind(x.mu.sd, y.name, imported.ds$sub) ;
  #produce final dataset
  tidy.ds <- build.tidy.ds(combined);
  #write a final csv file
  write.csv(tidy.ds, "TIDY_UCI_HAR.csv", row.names=FALSE)
}

tidydata();
