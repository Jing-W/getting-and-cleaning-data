## load the needed libraries
library(reshape2)

## read the training data
## the number of observations (rows) in subject_train, X_train and y_train are the same.
## subject_train contains the subject id [1, 30] for each observation
## y_train contains activity label [1, 6] for each observation
## X_train contains 561 variables, each calculated from a window (a row) of captured data in the raw data set (Inertial Signals folder)
## We don't consider the raw data set (Inertial Signals folder) here.
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## creat one data frame for the training data
data_train <- cbind(y_train, subject_train, X_train)
colnames(data_train)[1:2] <- c("activity", "subject")

## read the test data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

## create one data frame for the test data
data_test <- cbind(y_test, subject_test, X_test)
colnames(data_test)[1:2] <- c("activity", "subject")

## merge the training and the test sets to create one data set
data_all <- merge(data_train, data_test, all = TRUE)

## find the feature indices for mean and std measurements
## here I'm searching for the names containing mean() or std()
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features_mean_index <- which(apply(features, 1, function(x) any(grepl("mean()", x, fixed = TRUE))))
features_std_index <- which(apply(features, 1, function(x) any(grepl("std()", x, fixed = TRUE))))
features_mean_std_index <- sort(c(features_mean_index, features_std_index))

## extract only the measurements on the mean and standard deviation for each measurement
data_extracted <- data_all[, c(1, 2, (features_mean_std_index + 2))]

## change the column names of data_extracted to the names of features
colnames(data_extracted) <- c("activity", "subject", features[features_mean_std_index, 2])

## process the column names of data_extracted
## following the rules: 1. all lower case, 2. remove "-" and "()"
colnames(data_extracted) <- tolower(colnames(data_extracted))
colnames(data_extracted) <- gsub("-", "", colnames(data_extracted))
colnames(data_extracted) <- gsub("\\()", "", colnames(data_extracted))

## melt data
data_melt <- melt(data_extracted, id = c("activity", "subject"))

## calculate average of each variable for each activity and each subject
##  "..." expands to all variables not otherwise included in the formula
data_tidy <- dcast(data_melt, ... ~ variable, mean)

## convert the activity names to descriptive names
## first read the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
## process the names
activity_labels[, 2] <- tolower(activity_labels[, 2])
activity_labels[, 2] <- gsub("_", "", activity_labels[, 2])
## process the tidy data set activity column
data_tidy$activity <- as.factor(data_tidy$activity)
levels(data_tidy$activity) <- activity_labels[, 2]

## write the tidy data result to txt file
write.table(data_tidy, file = "./data_tidy.txt")