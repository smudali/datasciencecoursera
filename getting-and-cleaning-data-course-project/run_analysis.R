## Name: run_analysis.R
## The script does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set
##    with the average of each variable for each activity and each subject.

## Author: Sugath Mudali, Getting and Cleaning Data - Johns Hopskins University,
## Coursera
## Date: 11/09/2017

library(reshape2)

write_tiny_data <- function() {
  # The name of the downloaded zip file
  dataset.filename <- "dataset.zip"
  
  # Check the directory, only download & unzip if it is not present
  if (!file.exists('UCI HAR Dataset')) {
    # Download and unzip the dataset if it doesn't exist
    if (!file.exists(dataset.filename)) {
      print('Downloading ... please wait')
      
      fileURL <-
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
      download.file(fileURL, dataset.filename, method = "curl")
      
      print ('Unzipping the downloaded file')
    }
    unzip(dataset.filename)
  }
  else {
    print ('Using previously downloaded data')
  }
  
  # Set the data set directory
  dataset.dir <- "./UCI HAR Dataset/"
  
  # Read activity labels
  activity.labels <-
    read.table(paste0(dataset.dir, "activity_labels.txt"))
  
  # Read features
  features <- read.table(paste0(dataset.dir, "features.txt"))
  
  # Filter only features we need - this is a vector of indexs
  features.wanted <- grep("mean\\(\\)|std\\(\\)", features[, 2])
  
  # Names of filters we want
  features.wanted.names <- features[features.wanted, 2]
  
  # Substitite mean with Mean and std with Std, also remove ()
  features.wanted.names <-
    gsub('mean', 'Mean', features.wanted.names)
  features.wanted.names <- gsub('std', 'Std', features.wanted.names)
  features.wanted.names <- gsub('[()]', '', features.wanted.names)
  
  # Add 'TimeDomain'  to names start with t and 'FreqDomain' for names starting with f
  features.wanted.names <- gsub("^t", "TimeDomain", features.wanted.names)
  features.wanted.names <- gsub("^f", "FreqDomain", features.wanted.names)
  
  # Fix the typo with double word
  features.wanted.names <- gsub("BodyBody", "Body", features.wanted.names)
  
  #### Start of reading training data ###########################################
  
  # Read train set
  train.data <-
    read.table(paste0(dataset.dir, "train/X_train.txt"), header = FALSE)[features.wanted]
  
  # Read train labels
  train.activities <-
    read.table(paste0(dataset.dir, "train/Y_train.txt"), header = FALSE)
  
  # Read subject
  train.subjects <-
    read.table(paste0(dataset.dir, "train/subject_train.txt"), header = FALSE)
  
  # Add subjects, labels to the train set
  train.data <- cbind(train.subjects, train.activities, train.data)
  
  #### End of reading training data #############################################
  
  #### Start of reading test data ###############################################
  
  # Read test set
  test.data <-
    read.table(paste0(dataset.dir, "test/X_test.txt"), header = FALSE)[features.wanted]
  
  # Read test labels
  test.activities <-
    read.table(paste0(dataset.dir, "test/Y_test.txt"), header = FALSE)
  
  # Read subject
  test.subjects <-
    read.table(paste0(dataset.dir, "test/subject_test.txt"), header = FALSE)
  
  # Add subjects, labels to the train set
  test.data <- cbind(test.subjects, test.activities, test.data)
  
  #### End of reading test data #################################################
  
  # Merge train and test datasets
  all.data <- rbind(train.data, test.data)
  
  # Set names to variables
  names(all.data) <- c("subject", "activity", features.wanted.names)
  
  # Convert activities into a factor variable using the activity table
  # levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING
  all.data$activity <-
    factor(all.data$activity,
           levels = activity.labels$V1,
           labels = activity.labels$V2)
  
  # Convert subjects into a factor, the range is from 1 to 30 as per the data set README
  all.data$subject <- factor(all.data$subject, levels = c(1:30))
  
  # Melt the data using id variables - subject and activity columns
  all.data.melted <- melt(all.data, id = c("subject", "activity"))
  
  # Calculate the mean and reshape data
  all.data.mean <-
    dcast(all.data.melted, subject + activity ~ variable, mean)
  
  # Write the tidy data
  tidy.dataset.filename = "tidy_data.txt"
  write.table(all.data.mean,
              tidy.dataset.filename,
              row.names = FALSE,
              quote = FALSE)
  
  # Creation of tidy data file creation
  if (file.exists(tidy.dataset.filename))
    print(sprintf(
      "Tidy data set file created: %s at %s",
      tidy.dataset.filename,
      Sys.time()
    ))
  all.data.mean
}
