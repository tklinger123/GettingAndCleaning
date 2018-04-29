## README.md

Project for Johns Hopkins University Coursera course Getting and Cleaning Data in the Data Science specialization.

#### Project Purpose

Demonstrate ability to collect, work with, and clean a data set. The employed data set comes from the Human Activity Recognition Using Smartphones Dataset and is available for download at: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 

#### Project Files

##### [run_analysis.R](run_analysis.R)
To use the [run_analysis.R](run_analysis.R) script you should first download the data. Second, update the path in the command <code>setwd()</code> in the script. Running the script may take a few minutes. It will load the orginal data and create new text files of tidy comma separated variable (CSV) data. The text file is named [run_analysis.txt](run_analysis.txt).

##### [run_analysis.txt](run_analysis.txt)
This aggregated tidy data set includes 180 rows and 81 columns. It aggregates the mean of each feature for each activity and each subject. For more details, see [CodeBook.md](CodeBook.md).

##### [CodeBook.md](CodeBook.md)
Describes the data, variables and transformations performed to clean up the data.
