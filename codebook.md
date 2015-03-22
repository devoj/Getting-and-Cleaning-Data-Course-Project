---
title: "Codebook.md"
output: html_document
---
Data ouput: A tidy data set of the mean of mean and standard deviation measurements from accelerometers on a Samsung Galaxy SII

Raw data is: 

-Volunteer_ID, extracted from the subject_train.txt or subject_test.txt. A numerical value that identifies the subject. There were 30 subjects, 1-30

-Activity, extracted from y_train.txt or y_test.txt. A numerical value that corresponds to the activity being performed. The activities were Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying.

-Measurement data. Numerical values of data from the accelerometers extracted from the x_train.txt or x_test.txt. They were a collection of the following...

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Each raw data set also had variables of transformed data in the following format...

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

-Column names for the measurements are taken from the feautes.txt file.

Codebook: The Volunteer ID is transfromed into a factor. The activity is tranformed into a factor and given a descriptive label, Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying. Only the measurements of mean and standard deviation are selected. The final output, Tidy_data.txt, will be the mean of the mean and standard deviation by Volunteer_ID and Activity.

