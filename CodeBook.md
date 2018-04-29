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

The following transformation were applied to the original data:

1. Column names were defined to training data using <code>'c("V1","Activity")'</code>. 
2. y-train data was merged with activity label.
3. Names from features were assigned to the x_train data frame.
4. y_train, activity labels, and x_train were combined using <code>'cbind(train_merge, x_train)'</code>.
5. The first column was removed from the resulting data to avoid error "duplicate column name".
6. Only the columns containing means and std were selected.
7. Steps 1. to 6. were repeated for test data.
8. Train and test data were combined and summarized.
