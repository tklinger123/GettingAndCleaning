# CodeBook.md 

Project for Johns Hopkins University Coursera course Getting and Cleaning Data in the Data Science specialization

## Tidy Data File

#### [run_analysis.txt](run_analysis.txt)
* 180 rows and 81 columns
* Aggregates the mean of each feature for each activity and each subject

#### Variables stored in [run_analysis.txt](run_analysis.txt)
* column 1 : "Subject" : Subject ID number for 30 subjects (1-30)
* column 2 : "Activity" : Factor variable with six levels representing the physical activity performed by the subject during the measurement. Values include:
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING 
* columns 3-81 : Quantified "mean" and "std" features (described below) named with the pattern [t|f][description].[mean|std] optionally followed by .[X|Y|Z], e.g. <code>tBodyGyroJerk.mean.X</code> or <code>fBodyBodyGyroMag.mean</code>
	* t and f stand for time domain and frequency domain respectively
	* mean and std stand for average and standard deviation respectively
	* X, Y and Z represent Cartesian directions of the accelerometer coordinate frame

## Transformations from Original to Tidy Data

The following transformation were applied to the original data

1. Column names were defined using <code>'c("V1","Activity")'</code>. 

2.  <code>'-'</code> character in feature names substituted with a period <code>'.'</code>
3.  <code>'()'</code> character pattern substituted with empty string <code>''</code>
4.  Numeric Activity labels converted to character labels according to:
	* 1 -> WALKING
	* 2 -> WALKING_UPSTAIRS
	* 3 -> WALKING_DOWNSTAIRS
	* 4 -> SITTING
	* 5 -> STANDING
	* 6 -> LAYING	
5.  Subject column named "Subject"
6.  Activity column named "Activity"
7.  Row combined train and test data
8.  Column combined Subject, Activty and Feature columns
7.  Write [tidy.txt](tidy.txt)
8.  Aggregate by "Subject" and "Activity" and write [tidy_aggregated.txt](tidy_aggregated.txt)
	
