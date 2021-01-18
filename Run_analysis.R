library(dplyr)
if (!dir.exists("/Users/tbaker/Desktop/Data_Cleaning_Assignment")) {
        dir.create("/Users/tbaker/Desktop/Data_Cleaning_Assignment")
        setwd("/Users/tbaker/Desktop/Data_Cleaning_Assignment")
}
if (!file.exists("CourseProject.csv")){
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileurl, destfile = "./CourseProject.csv", method = "curl")
}

if(!file.exists("UCI HAR Dataset")){
        unzip("CourseProject.csv")
}

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
        colnames(activities) <- c("class_label", "activity")
features <- read.table("UCI HAR Dataset/features.txt")
        colnames(features) <- c("n", "feature")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        colnames(subject_test) <- "subject"
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        colnames(x_test) <- features$feature
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        colnames(y_test) <- "class_label"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        colnames(subject_train) <- "subject"
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        colnames(x_train) <- features$feature
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        colnames(y_train) <- "class_label"

x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)
merged_data <- cbind(subject, x, y )

tidy_data <- merged_data %>%
        select(subject, class_label, contains("mean"), contains("std"))

tidy_data$class_label <- activities[tidy_data$class_label ,2]
names(tidy_data) <- gsub("class_label", "activity", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data,))
names(tidy_data) <- gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data) <- gsub("-std", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("-freq", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data) <- gsub("gravity", "Gravity", names(tidy_data))
names(tidy_data) <- gsub("angle", "Angle", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))


finished_data <- tidy_data %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(finished_data, "FinishedData.txt", row.names = FALSE)


                         