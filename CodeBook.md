This is the code book for the script run_analysis.R, a script that gets the data collected from the accelerometers from the Samsung Galaxy S smartphone and creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This code book describes the variables, the data, and the transformations done to clean up the data.

Information about the variables:

The original data is collected from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The data is collected from the accelerometers from the Samsung Galaxy S smartphone. More information on the original data set and the study is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The variables contained in the tidy data set are:
<table>
  <tr>
    <td>[1]</td>
    <td>"Activities"</td>
    <td>"Subjects"</td>
    <td>"Mean.tBodyAcc.mean.X"</td>
  </tr>
  <tr>
    <td>[4]</td>
    <td>"Mean.tBodyAcc.mean.Y"</td>
    <td>"Mean.tBodyAcc.mean.Z"</td>
    <td>"Mean.tBodyAcc.std.X"</td>
  </tr>
  <tr>
    <td>[7]</td>
    <td>"Mean.tBodyAcc.std.Y"</td>
    <td>"Mean.tBodyAcc.std.Z"</td>
    <td>"Mean.tGravityAcc.mean.X"</td>
  </tr>
  <tr>
    <td>[10]</td>
    <td>"Mean.tGravityAcc.mean.Y"</td>
    <td>"Mean.tGravityAcc.mean.Z"</td>
    <td>"Mean.tGravityAcc.std.X"</td>
  </tr>
  <tr>
    <td>[13]</td>
    <td>"Mean.tGravityAcc.std.Y"</td>
    <td>"Mean.tGravityAcc.std.Z"</td>
    <td>"Mean.tBodyAccJerk.mean.X"</td>
  </tr>
  <tr>
    <td>[16]</td>
    <td>"Mean.tBodyAccJerk.mean.Y"</td>
    <td>"Mean.tBodyAccJerk.mean.Z"</td>
    <td>"Mean.tBodyAccJerk.std.X"</td>
  </tr>
  <tr>
    <td>[19]</td>
    <td>"Mean.tBodyAccJerk.std.Y"</td>
    <td>"Mean.tBodyAccJerk.std.Z"</td>
    <td>"Mean.tBodyGyro.mean.X"</td>
  </tr>
  <tr>
    <td>[22]</td>
    <td>"Mean.tBodyGyro.mean.Y"</td>
    <td>"Mean.tBodyGyro.mean.Z"</td>
    <td>"Mean.tBodyGyro.std.X"</td>
  </tr>
  <tr>
    <td>[25]</td>
    <td>"Mean.tBodyGyro.std.Y"</td>
    <td>"Mean.tBodyGyro.std.Z"</td>
    <td>"Mean.tBodyGyroJerk.mean.X"</td>
  </tr>
  <tr>
    <td>[28]</td>
    <td>"Mean.tBodyGyroJerk.mean.Y"</td>
    <td>"Mean.tBodyGyroJerk.mean.Z"</td>
    <td>"Mean.tBodyGyroJerk.std.X"</td>
  </tr>
  <tr>
    <td>[31]</td>
    <td>"Mean.tBodyGyroJerk.std.Y"</td>
    <td>"Mean.tBodyGyroJerk.std.Z"</td>
    <td>"Mean.tBodyAccMag.mean"</td>
  </tr>
  <tr>
    <td>[34]</td>
    <td>"Mean.tBodyAccMag.std"</td>
    <td>"Mean.tGravityAccMag.mean"</td>
    <td>"Mean.tGravityAccMag.std"</td>
  </tr>
  <tr>
    <td>[37]</td>
    <td>"Mean.tBodyAccJerkMag.mean"</td>
    <td>"Mean.tBodyAccJerkMag.std"</td>
    <td>"Mean.tBodyGyroMag.mean"</td>
  </tr>
  <tr>
    <td>[40]</td>
    <td>"Mean.tBodyGyroMag.std"</td>
    <td>"Mean.tBodyGyroJerkMag.mean"</td>
    <td>"Mean.tBodyGyroJerkMag.std"</td>
  </tr>
  <tr>
    <td>[43]</td>
    <td>"Mean.fBodyAcc.mean.X"</td>
    <td>"Mean.fBodyAcc.mean.Y"</td>
    <td>"Mean.fBodyAcc.mean.Z"</td>
  </tr>
  <tr>
    <td>[46]</td>
    <td>"Mean.fBodyAcc.std.X"</td>
    <td>"Mean.fBodyAcc.std.Y"</td>
    <td>"Mean.fBodyAcc.std.Z"</td>
  </tr>
  <tr>
    <td>[49]</td>
    <td>"Mean.fBodyAccJerk.mean.X"</td>
    <td>"Mean.fBodyAccJerk.mean.Y"</td>
    <td>"Mean.fBodyAccJerk.mean.Z"</td>
  </tr>
  <tr>
    <td>[52]</td>
    <td>"Mean.fBodyAccJerk.std.X"</td>
    <td>"Mean.fBodyAccJerk.std.Y"</td>
    <td>"Mean.fBodyAccJerk.std.Z"</td>
  </tr>
  <tr>
    <td>[55]</td>
    <td>"Mean.fBodyGyro.mean.X"</td>
    <td>"Mean.fBodyGyro.mean.Y"</td>
    <td>"Mean.fBodyGyro.mean.Z"</td>
  </tr>
  <tr>
    <td>[58]</td>
    <td>"Mean.fBodyGyro.std.X"</td>
    <td>"Mean.fBodyGyro.std.Y"</td>
    <td>"Mean.fBodyGyro.std.Z"</td>
  </tr>
  <tr>
    <td>[61]</td>
    <td>"Mean.fBodyAccMag.mean"</td>
    <td>"Mean.fBodyAccMag.std"</td>
    <td>"Mean.fBodyAccJerkMag.mean"</td>
  </tr>
  <tr>
    <td>[64]</td>
    <td>"Mean.fBodyAccJerkMag.std"</td>
    <td>"Mean.fBodyGyroMag.mean"</td>
    <td>"Mean.fBodyGyroMag.std"</td>
  </tr>
  <tr>
    <td>[67]</td>
    <td>"Mean.fBodyGyroJerkMag.mean"</td>
    <td>"Mean.fBodyGyroJerkMag.std"</td>
    <td>-</td>
  </tr>
</table>

This list of variables was obtained with the following code:

    # considering the tidy data is in the variable 'data'
    names(data)

"Activities": Activities performed by the subjects in the experiment. Activities is a `factor` with 6 levels. The levels are: `LAYING`, `SITTING`,`STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`.

"Subjects": An identifier of the subject who carried out the experiment. The variable "Subjects" is an `integer` going from 1 to 30. There are 30 subjects.

The measurement variables start with "Mean" because they represent the average of each variable for each activity and each subject. The measurement variables are `numeric`.

There are signals that are collected in 3-axial signals in the `X`, `Y` and `Z` directions, which are denoted with '.XYZ' in the variable name, these features are the following:

- tBodyAcc: time domain of body acceleration signals.
- tGravityAcc: time domain of gravity acceleration signals.
- tBodyAccJerk:time domain of the body acceleration derived to obtain Jerk signals.
- tBodyGyro: time domain of body angular velocity obtained from gyroscope signals.
- tBodyGyroJerk: time domain of the body angular velocity obtained from gyroscope signals derived to obtain Jerk signals.
- fBodyAcc: frequency domain of body acceleration signals.
- fBodyAccJerk: frequency domain of the body acceleration derived to obtain Jerk signals.
- fBodyGyro: frequency domain of body angular velocity obtained from gyroscope signals.

There are signals that are not collected in 3-axial signals (XYZ directions), they are:

- tBodyAccMag: magnitude of time domain of body acceleration signals calculated using the Euclidean norm.
- tGravityAccMag: magnitude of time domain of gravity acceleration signals calculated using the Euclidean norm.
- tBodyAccJerkMag: magnitude of time domain of body acceleration derived to obtain Jerk signals calculated using the Euclidean norm.
- tBodyGyroMag: magnitude of time domain of body angular velocity obtained from gyroscope signals.
- tBodyGyroJerkMag: magnitude of time domain of the body angular velocity obtained from gyroscope derived to obtain Jerk signals.
- fBodyAccMag: magnitude of frequency domain of body acceleration signals calculated using the Euclidean norm.
- fBodyAccJerkMag: magnitude of frequency domain of the body acceleration derived to obtain Jerk signals.
- fBodyGyroMag: magnitude of frequency domain of body angular velocity obtained from gyroscope signals.
- fBodyGyroJerkMag: magnitude of frequency domain of the body angular velocity obtained from gyroscope derived to obtain Jerk signals.

The set of measurements that were calculated from these signals are:

- mean: Mean value.
- std: Standard deviation.

The detailed explanation of how each measurement variable was calculated is in the feature selection explanation from 'features_info.txt' of the original data set, available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information about the summary choices made:

The original data set contains:
- for the training set: **7,352** observations and **563** variables (**561** measurement variables + **1** variable for activities and **1** variable for subjects).
- for the test set: **2,947** observations and **563** variables (**561** measurement variables + **1** variable for activities and **1** variable for subjects).

The script merges the training and the test sets to create one data set. The merged data set contains **10,299** observations and **563** variables.

The **563** variables of the data set were appropriately labelled with descriptive variable names from the complete list of variables of each feature vector in 'features.txt', available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From the complete data set, the 'run_analysis.R' script extracts only the measurements on the mean and standard deviation for each measurement. The strategy used in this script is to select all columns that have the following names: `mean()`, `std()`, `Subjects` and `Activities`.

This transformation results in a data set containing **10,299** observations and **68** variables.

Once the data frame contains the desired variables, the variable names are corrected to appropriately label the data set with valid variable names, as obtained from the function `make.names()` to make syntactically valid names out of character vectors.

For the purpose of having valid variable names, the symbol parentheses `()` was removed and the symbol hyphen `-` was substituted by a period `.`. In addition to that, an unnecessary repetition of the word `Body` was removed.

The activity contains numbers from **1** to **6** to represent the types of activities. The descriptive activity names `LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS` (from the list of activity labels in activity_labels.txt from the original data set) are used  to name the activities.

From the data set above, the script creates a second, independent tidy data set with the
average of each variable for each activity and each subject.

With the data set containing mean of variables, the script appropriately labels the tidy data set adding `Mean` in the begging of the measurement variable names.

The tidy data set is written in a text file.
To read the text file, use the following R code:

    # header = TRUE indicates the file contains the variables' names
    # as its first line.
    data <- read.table("MeansBySubjectsActivities.txt", header = TRUE)

Information about the experimental study design used:

The experiments have been carried out with a group of **30** volunteers within an age bracket of **19-48** years. Each person performed six activities (`LAYING`, `SITTING`, `STANDING`, `WALKING`, `WALKING_DOWNSTAIRS`, `WALKING_UPSTAIRS`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

More information about this experiment is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
