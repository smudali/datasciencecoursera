# Getting and Cleaning Data Course Project

This repository contains my solution to the Coursera Getting And Cleaning Data Course project. The goal is to prepare a tidy data set from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This repository contains the following files:

- *README.md*, this file, provides an overview of the data set and how it was created
- *tidy_data.txt*, a tidy data set
- *CodeBook.md*, a code book that describes the variables, the data, and any transformations or work that have performed to clean up the data
- *run_analysis.R*, the R script to create the data set (see the [Creating the data set](#creating-data-set) section below) 

## Background (from the Coursera Course Project)

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Creating the data set <a name="creating-data-set"></a>

The R script *run_analysis.R* performs the following steps (see the Code book for details about data, as well as the comments in the script itself):

- Download the Human Activity Recognition (HAR) dataset only for the condition:
-- No *UCI HAR Dataset* directory
-- No *dataset.zip* file in the current directory 
- Unzip the downloaded file (*dataset.zip*)
- Read both training and data sets
- Extract only the mean and standard deviation features for each measurement
- Merge the training and the test sets to create one data set
- Apply descriptive active labels to the data set
- Create a second, independent tidy set with the average of each variable for each activity and each subject
- Write the data set to the *tidy_data.txt* file

The *run_analysis.R* script was built and tested using R version 3.4.1 (2017-06-30) on Windows 7 32-bit version. The script also requires the following libraries:
- curl
- reshape2

### How to run

```R
source("run_analysis.R")
x <- write_tiny_data()
```

If you run the script for the first time, it will download the HAR dataset and unpack it in the current directory. All the required input files are under the *UCI HAR Dataset* directory. The script wouldn't download and unzip if it detects *UCI HAR Dataset* directory in the current directory. The tidy data file (*tidy_data.txt*) will be created in the current directory.

In addition to the tidy data file, the script also returns a 'data.frame' (refers to as x above in the code snippet) with 180 observations of 81 variables (see Code book for more details)

#### Messages
The following messages are displayed to the console

[1] "Downloading ... please wait" - downloading in progress
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 59.6M  100 59.6M    0     0   902k      0  0:01:07  0:01:07 --:--:--  800k
[1] "Unzipping the downloaded file" - 
* 'UCI HAR Dataset' directory was missing and no dataset.zip file found in the current directory
*Above is an example only!*

[1] "Using previously downloaded data"
Displayed to indicate that the script is using a previosuly downloaded dataset

[1] "Tidy data set file created: tidy.txt at 2017-09-10 23:34:49"
* Confirmation that the tidy_data.txt was cerated sucessfully *

### Notes
To generate the tidy data file using the dataset from the URL, please remove the 'UCI HAR Dataset' directory and 'dataset.zip' file if exists. If the 'dataset.zip' exists in the current directory, the script will simply extract it without downloading from the URL
