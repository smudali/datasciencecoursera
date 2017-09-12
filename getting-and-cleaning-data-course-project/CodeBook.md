# Codebook

The data set that this code book relates to the *tidy_data.txt* file of this repository. See the *README.md* file for background information on this data set.

The structure of the data set is described in the [Data](#data) section. Transformations that were carried out to obtain the data set based on the source data are presented under the Transformations section.

The dataset contains data for 30 persons, each one was tracked for 6 activities, so there are a total of 180 observations. There are a total of 68 columns in this data set. Each row contains data related to 1 activity for a certain person (subject). Each row contains data for 66 variables, each one being the average (mean) of the raw data for the corresponding person/activity combination.

# Data <a name="data"></a>

## Identifiers

* subject - Factor with 30 levels (representing a person) "1","2","3","4", ....
* activity - Factor with 6 levels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## Features
Each feature contains a single measurement as listed below. Naming pattern for features:

1. features starting with "FreqDomain" contains data after applying the Fast Fourier Transform
2. features starting with "TimeDomain" contains time domain signals
3. features ending with "Mean" or "Mean/-X/-Y/-Z" contains the mean data for 3-axial signals in the X, Y and Z directions
4. features ending with "Std" or "Std/-X/-Y/-Z" contains the mean of the standard deviation data for 3-axial signals in the X, Y and Z directions

* TimeDomainBodyAcc-Mean-X
* TimeDomainBodyAcc-Mean-Y
* TimeDomainBodyAcc-Mean-Z
* TimeDomainBodyAcc-Std-X
* TimeDomainBodyAcc-Std-Y
* TimeDomainBodyAcc-Std-Z
* TimeDomainGravityAcc-Mean-X
* TimeDomainGravityAcc-Mean-Y
* TimeDomainGravityAcc-Mean-Z
* TimeDomainGravityAcc-Std-X
* TimeDomainGravityAcc-Std-Y
* TimeDomainGravityAcc-Std-Z
* TimeDomainBodyAccJerk-Mean-X
* TimeDomainBodyAccJerk-Mean-Y
* TimeDomainBodyAccJerk-Mean-Z
* TimeDomainBodyAccJerk-Std-X
* TimeDomainBodyAccJerk-Std-Y
* TimeDomainBodyAccJerk-Std-Z
* TimeDomainBodyGyro-Mean-X
* TimeDomainBodyGyro-Mean-Y
* TimeDomainBodyGyro-Mean-Z
* TimeDomainBodyGyro-Std-X
* TimeDomainBodyGyro-Std-Y
* TimeDomainBodyGyro-Std-Z
* TimeDomainBodyGyroJerk-Mean-X
* TimeDomainBodyGyroJerk-Mean-Y
* TimeDomainBodyGyroJerk-Mean-Z
* TimeDomainBodyGyroJerk-Std-X
* TimeDomainBodyGyroJerk-Std-Y
* TimeDomainBodyGyroJerk-Std-Z
* TimeDomainBodyAccMag-Mean
* TimeDomainBodyAccMag-Std
* TimeDomainGravityAccMag-Mean
* TimeDomainGravityAccMag-Std
* TimeDomainBodyAccJerkMag-Mean
* TimeDomainBodyAccJerkMag-Std
* TimeDomainBodyGyroMag-Mean
* TimeDomainBodyGyroMag-Std
* TimeDomainBodyGyroJerkMag-Mean
* TimeDomainBodyGyroJerkMag-Std
* FreqDomainBodyAcc-Mean-X
* FreqDomainBodyAcc-Mean-Y
* FreqDomainBodyAcc-Mean-Z
* FreqDomainBodyAcc-Std-X
* FreqDomainBodyAcc-Std-Y
* FreqDomainBodyAcc-Std-Z
* FreqDomainBodyAccJerk-Mean-X
* FreqDomainBodyAccJerk-Mean-Y
* FreqDomainBodyAccJerk-Mean-Z
* FreqDomainBodyAccJerk-Std-X
* FreqDomainBodyAccJerk-Std-Y
* FreqDomainBodyAccJerk-Std-Z
* FreqDomainBodyGyro-Mean-X
* FreqDomainBodyGyro-Mean-Y
* FreqDomainBodyGyro-Mean-Z
* FreqDomainBodyGyro-Std-X
* FreqDomainBodyGyro-Std-Y
* FreqDomainBodyGyro-Std-Z
* FreqDomainBodyAccMag-Mean
* FreqDomainBodyAccMag-Std
* FreqDomainBodyAccJerkMag-Mean
* FreqDomainBodyAccJerkMag-Std
* FreqDomainBodyGyroMag-Mean
* FreqDomainBodyGyroMag-Std
* FreqDomainBodyGyroJerkMag-Mean
* FreqDomainBodyGyroJerkMag-Std

## Transformation
Follwong transformations have been performed to clean the data:

* Only included the features containing either mean() or std() in feature names
* Converted names *mean* to *Mean* and *std* to *Std*
* Removed '()' from names; for example, Mean() became Mean and Std() became Std
* Features starting with letter 't' converted to TimeDomain, for example, the feature name *tBodyAcc-mean()-X* became *TimeDomainBodyAcc-Mean-X*
* Features starting with letter 'f' converted to FreqDomain, for example, the feature name *fBodyAcc-mean()-X* became *FreqDomainBodyAcc-Mean-X*
* Feature names with *BodyBody* reduced to *Body*, for example, fBodyBodyAccJerkMag-std() became *FreqDomainBodyAccJerkMag-Std*
