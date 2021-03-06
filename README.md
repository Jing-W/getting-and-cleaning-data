README for getting and cleaning data course project
========================================================

**This file is an explanation of how the script run_analysis.R works.**

We first load the needed library reshape2.


```r
library(reshape2)
```


For the datasets, the number of observations (rows) in subject_train, X_train and y_train are the same. subject_train contains the subject id [1, 30] for each observation, y_train contains activity label [1, 6] for each observation, and X_train contains 561 variables, each calculated from a window (a row) of captured data in the raw data set (Inertial Signals folder). We don't need to consider the raw data set (Inertial Signals folder) here.

Next, we read in the training data and combine them to one data fram data_train. Also rename the first two columns to activity and subject.

```r
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
data_train <- cbind(y_train, subject_train, X_train)
colnames(data_train)[1:2] <- c("activity", "subject")
```


Then we read in the test data the same way.

```r
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
data_test <- cbind(y_test, subject_test, X_test)
colnames(data_test)[1:2] <- c("activity", "subject")
```


Now we can merge the training and the test sets to create one data set.

```r
data_all <- merge(data_train, data_test, all = TRUE)
```


We only need the measurements on the mean and standard deviation for each measurement. The following code searches for the names containing mean() or std(), combines and sorts the indices.

```r
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features_mean_index <- which(apply(features, 1, function(x) any(grepl("mean()", 
    x, fixed = TRUE))))
features_std_index <- which(apply(features, 1, function(x) any(grepl("std()", 
    x, fixed = TRUE))))
features_mean_std_index <- sort(c(features_mean_index, features_std_index))
```


Then we can extract the desired columns from data_all as follows.

```r
data_extracted <- data_all[, c(1, 2, (features_mean_std_index + 2))]
```


Next we want to have descriptive feature names. First we change the column names of data_extracted to the original names of features.

```r
colnames(data_extracted) <- c("activity", "subject", features[features_mean_std_index, 
    2])
```


Then we process the column names of data_extracted following the rules: 1. all lower case, 2. remove "-" and "()".

```r
colnames(data_extracted) <- tolower(colnames(data_extracted))
colnames(data_extracted) <- gsub("-", "", colnames(data_extracted))
colnames(data_extracted) <- gsub("\\()", "", colnames(data_extracted))
```


Next, we need to calculate average of each variable for each activity and each subject. In order to do this, we fisrt melt the data. Now all the features are melt into the column "variable".

```r
data_melt <- melt(data_extracted, id = c("activity", "subject"))
```


Now we can use the dcast function to calculate the mean (average) for each feature. In dcast function, "..." expands to all variables not otherwise included in the formula.

```r
data_tidy <- dcast(data_melt, ... ~ variable, mean)
```


Lastly, we still need to convert the activity names to descriptive names. The following code reads the activity labels and processes them.

```r
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity_labels[, 2] <- tolower(activity_labels[, 2])
activity_labels[, 2] <- gsub("_", "", activity_labels[, 2])
```


Now we can process the data_tidy activity column. Here I'm converting it to factors first, then change the level names.

```r
data_tidy$activity <- as.factor(data_tidy$activity)
levels(data_tidy$activity) <- activity_labels[, 2]
```


Finally, the data_tidy is ready to be written into to a txt file.

```r
write.table(data_tidy, file = "./data_tidy.txt")
```


