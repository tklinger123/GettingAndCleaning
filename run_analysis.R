#
# Programming Assignment JHU Getting and Cleaning Data
# Thomas Klinger
#
# You should create one R script called run_analysis.R that does the following:
#
# * Merges the training and the test sets to create one data set.
# * Extracts only the measurements on the mean and standard deviation for each measurement.
# * Uses descriptive activity names to name the activities in the data set
# * Appropriately labels the data set with descriptive variable names.
# * From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.

# define working directory and variables
setwd("/Users/madritsch/Dropbox/_coursera/Data Science - JHU/work/UCI HAR Dataset")
y_train <- read.table("train/y_train.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")

features <- read.table("features.txt", quote="\"")
activity_labels <- read.table("activity_labels.txt", quote="\"")

subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")

x_train <- read.table("train/X_train.txt", quote="\"")
x_test <- read.table("test/X_test.txt", quote="\"")

# generating training data
colnames(activity_labels) <- c("V1","Activity")

# merging y_train with activity label
subject <- rename(subject_train, subject=V1)
train <- cbind(y_train,subject)
train_merge <- merge(train,activity_labels, by=("V1"))

# assigning names from features to the x_train data frame
colnames(x_train) <- features[,2]

# combining y_train, activity labels, x_train
train_combine <- cbind(train_merge, x_train)

# eliminating first column from train_combine to avoid duplicate column name
train_new <- train_combine[,-1]

# selecting only the columns that contains means and std
train_tidy <- select(train_new,contains("subject"), contains("Activity"), contains("mean"), contains("std"))


# generating test data
colnames(activity_labels)<- c("V1","Activity")

# merging y_test with activity label
subjecta <- rename(subject_test, subject=V1)
test <- cbind(y_test, subjecta)
test_merge <- merge(test, activity_labels, by=("V1"))

# assigning names from features to the x_test data frame
colnames(x_test)<- features[,2]

# combining y_test, activity labels, x_test
test_combine <- cbind(test_merge, x_test)

# eliminating first column from train_combine to avoid duplicate column name
test_new <- test_combine[,-1]

# selecting only the columns that contains means and std
test_tidy <- select(test_new, contains("subject"), contains("Activity"), contains("mean"), contains("std"))


# combining train data with test data
train_test_combined <- rbind(train_tidy, test_tidy)

#Summarizing the data

analysis <- (train_test_combined%>%
                  group_by(subject,Activity) %>%
                  summarise_each(funs( mean)))

print(analysis)