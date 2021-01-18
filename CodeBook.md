# 1. Downloading the Data
    Download the data
      Extract in folder `UCI HAR Dataset
# 2. Assigning the data to variable
    activities <- activity_labels.txt (6 rows, 2 columns)
        List of activities and their labels
        
features <- features.txt (561 rows, 2 columns)
        features based upon the tAcc-XYZ and tGyro-XYZ, which are accelerometer and gyroscope 3 axial raw signals 
        
subject_test <- subject_test.txt (2947 rows, 1 column)
         stores the "test" data for 9 of the 30 subjects under observation
         
x_test <- X_test.txt (2947 rows, 561 columns)
         Recorded test data for the features

y_test <- y_test.txt (2947 rows, 1 column)
         Recorded test data for the activity labels

subject_train <- subject_train.txt (7352 rows, 1 column)
         training data for the 21 of 30 subjects under observation

x_train <- X_train.txt (7352 rows, 561 columns)
         Recorded training data for the features

y_train <- y_train.txt
         Recorded training data for the activity labels

# 3. Merges the training and the test sets to create one data set.

subject (10299 rows, 1 column) 
       created by using rbind() to merge `subject_test` and `subject_test`
x (10299 rows, 561 columns)
       created by using rbind() to merge X_test and X_train
y (10299 rows, 1 column
       created by using rbind() to merge y_test and y_train
merged_data (10299 rows, 561 columns)
       created by using cbind() to merge x,y, and subject
# 4. Extracts only the measurements on the mean and standard deviation for each measurement. 

  tidy_data (10299 rows, 88 columns)
    created by subsetting merged_data to select only the subject and class labels columns as well as the mean and standard deviation measurements 
    
# 5. Uses descriptive activity names to name the activities in the data set
      All of the class label column numbers for tidy_data were replaced with their corresponding activity as specified in the activities variable
     
# 6. Appropriately labels the data set with descriptive variable names. 
        Replaced Acc with Accelerometer
        Replaced Gyro with Gyroscope
        Replaced MAG with Magnitude
        Replaced BodyBody with Body
        Replaced anything beginning with t with Time
        Replaced anything beginning with f with Frequency
        Replaced angle with Angle
        Replaced -std with STD
        Replaced -mean() with Mean
        
# 7. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      finished_data(180 rows, 88 columns)
      created by summarizing tidy_data to take the mean of each variable for activity and subject, after having been previously groupped by both subject and activity
      finished_data is exported into FinishedData.txt
