The purpose of this project is to collect, work with, clean a data set and prepare tidy data that can be used for later analysis.

The project includes the following files:

1. README.md: The present file that explains how the script works and how all the files are connected.

2. run_analysis.R: Script that gets the data collected from the accelerometers from the Samsung Galaxy S smartphone and creates a second, independent tidy data set with the average of each variable for each activity and each subject. The generated tidy data set is saved in a text file, explained in number 4.

3. CodeBook.md: file that describes the variables, the data, the experiment and the transformations done to clean up the data.

4. MeansBySubjectsActivities.txt: the generated tidy data set saved in a text file with the average of each variable for each activity and each subject. This generated tidy data set follows the principles of tidy data of Hadley Wickham (2014).

In order to run the script run_analysis.R,  save the file run_analysis.R and the decompressed file of the Samsung data set in your working directory. The file of the Samsung data set is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Open the script run_analysis.R in RStudio and run it.

The run_analysis.R script creates one data set from the original training and test data sets. From this merged data set, it appropriately labels the data set with descriptive variable names. Once the variable names are labeled, it uses the labels to extract only the measurements on the mean and standard deviation for each measurement. It  uses  descriptive activity names to name the activities in the merged data set. Finally, from this data set, it creates a second, independent tidy data set with the average of each variable for each activity and each subject. Details, on how these steps are done, are described in the CodeBook.md and the code is documented in the script run_analysis.R.

After the script run_analysis.R is run and the tidy data set MeansBySubjectsActivities.txt is generated in the working directory, this text file can be read into R using the following code:

    # header = TRUE indicates the file contains the variables' names
    # as its first line.
    data <- read.table("MeansBySubjectsActivities.txt", header = TRUE)

Reference:
H. Wickham, "Tidy data" Journal of Statistical Software. Vol. 59, Issue 10, Sep 2014.  Available: http://vita.had.co.nz/papers/tidy-data.html.
