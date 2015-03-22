run_analysis <- function(){
  # R script to collect, work with, and clean a data set
  # from the accelerometers from the Samsung Galaxy S smartphone.
  
  ## Merge the training and the test sets to create one data set.##
  # Read the training data set
  X.training.set <- read.table("UCI HAR Dataset/train/X_train.txt")
  # Read the activities of the training data set
  y.training.set <- read.table("UCI HAR Dataset/train/y_train.txt")
  # Read the subjects of the training data set
  subject.training.set <- read.table("UCI HAR Dataset/train/subject_train.txt")
  # Combine data together for the training set
  training.set <-cbind(X.training.set, y.training.set, subject.training.set)
  
  # Read the test data set
  X.test.set <- read.table("UCI HAR Dataset/test/X_test.txt")
  # Read the activities of the test data set
  y.test.set <- read.table("UCI HAR Dataset/test/y_test.txt")
  # Read the subjects of the test data set
  subject.test.set <- read.table("UCI HAR Dataset/test/subject_test.txt")
  # Combine data together for the test set
  test.set <-cbind(X.test.set, y.test.set, subject.test.set)
  
  # Merge the training and the test sets 
  merged.train.test.sets <- rbind(training.set, test.set)
  
  ## Label the data set with descriptive variable names. ##
  # Read the features
  features <- read.table("UCI HAR Dataset/features.txt") 
  # Name the columns using the features file 
  # and name the last two columns as Activities and Subjects
  names(merged.train.test.sets) <- c(as.character(features[,2]),"Activities","Subjects")
  
  ## Extract only the measurements on the mean and standard deviation for each measurement. ##
  # Search for matches to names within the list of column names
  # it returns a vector containing the matching elements themselves (with value = TRUE)
  # The strategy used in this script is to select all columns that have the following names:
  # mean(), std(), Activities, Subjects.
  df.mean.std <- merged.train.test.sets[,grep("mean\\()|std\\()|Activities|Subjects",names(merged.train.test.sets),value=TRUE)]
  
  # With the data frame containing the desired variables, 
  # label the data set with descriptive and valid variable names. 
  # Across all columns, replace all instances of "()" with "."
  names(df.mean.std) <- gsub("\\()", "", names(df.mean.std))
  # Across all columns, replace all instances of "-" with "."
  names(df.mean.std) <- gsub("-", ".", names(df.mean.std))
  # Across all columns, replace all instances of "BodyBody" with "Body", 
  # there is unecessary repetition in fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag
  names(df.mean.std) <- gsub("BodyBody", "Body", names(df.mean.std))
  
  ## Use descriptive activity names to name the activities in the data set ##
  # Transform the Activities in factor
  df.mean.std$Activities <- factor(df.mean.std$Activities)
  # Read the activity labels
  activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  # Rename the factor levels
  levels(df.mean.std$Activities) <- activity.labels[,2]
  
  ## From the data set above, create a second, independent tidy data set with the 
  ## average of each variable for each activity and each subject. ##
  # load dplyr library
  library(dplyr)
  # Create a new data frame that groups the data by variables Subjects and Activities
  # The dataframe looks the same, but any following operation will take place by grouped variables.
  by_st_act <- group_by(df.mean.std, Activities, Subjects)
  
  # Calculate the mean across the columns that are not grouped.
  by_st_act_mean <- summarise_each(by_st_act,funs(mean))

  # With the data set containing the mean of variables,
  # appropriately label the data set adding Mean in the begging of their variable names. 
  names(by_st_act_mean)[3:68] <- paste("Mean", names(by_st_act_mean)[3:68], sep = ".")

  # Write the resulting tidy data set in a text file, 
  # use tabs, suppress row names and use column names
  write.table(by_st_act_mean,file="MeansBySubjectsActivities.txt", sep = "\t", row.names = F, col.names = T)

  # header = TRUE indicates the file contains the variables' names as its first line.
  # data <- read.table("MeansBySubjectsActivities.txt", header = TRUE)
}