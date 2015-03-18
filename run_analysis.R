#Script for Getting and Cleaning Data Course Project


#Load packages needed for script
library(dplyr)

#Downloadfile if it hasn't been done already
if(!file.exists("./Data.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
        destfile = "./Data.zip", mode = "wb")
}

#Unzip the file if it hasn't been done already
if(!file.exists("./UCI HAR Dataset")){
        unzip("./Data.zip")
}

#Read in the features.txt file for variable labels.
Variable_labels <- read.table("./UCI HAR Dataset/features.txt")

#Read in the x_train.txt file.
training_set_x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = Variable_labels[,2])

#Keep only the mean and standard deviation columns
training_set_x <- select(training_set_x, contains("mean"), contains("std"))

#Read in the y_train.txt file. Set "header = FALSE" to get correct number of 
#observations.
training_set_y <- read.csv("./UCI HAR Dataset/train/y_train.txt", 
                           header = FALSE)

#Read in the Training set labels I used read.csv. Only "header = FALSE" left me
#with the same number of observations as the training X and y sets
training_set_labels <- read.csv("./UCI HAR Dataset/train/subject_train.txt", 
                        header = FALSE)

#Add all of the training data sets to a data frame
training_data_frame <- data.frame(training_set_labels, training_set_y, training_set_x)

#Remove unused R objects to save memory space
rm(training_set_labels, training_set_x, training_set_y)


#Read in the x_test.txt file.
test_set_x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = Variable_labels[,2])

#Keep only the mean and standard deviation columns
test_set_x <- select(test_set_x, contains("mean"), contains("std"))

#Read in the y_test.txt file. Set "header = FALSE" to get correct number of 
#observations.
test_set_y <- read.csv("./UCI HAR Dataset/test/y_test.txt", 
                           header = FALSE)

#Read in the Test set labels I used read.csv. Only "header = FALSE" left me
#with the same number of observations as the test X and y sets
test_set_labels <- read.csv("./UCI HAR Dataset/test/subject_test.txt", 
                                header = FALSE)

#Add all of the test data sets to a data frame
test_data_frame <- data.frame(test_set_labels, test_set_y, test_set_x)

#Remove unused R objects to save memory space
rm(test_set_labels, test_set_x, test_set_y)


#Merge the two data frames together
train_and_test_data_frame <- rbind(training_data_frame, test_data_frame)

#Add descriptive names for volunteer ID and Activity
colnames(train_and_test_data_frame)[1:2] <- c("Volunteer_ID", "Activity")

                   
#Make Volunteer ID and Activity facotrs and add the descriptive label for the 
#"Activity" factor variable
train_and_test_data_frame <- mutate(train_and_test_data_frame, 
                             Activity = factor(train_and_test_data_frame$Activity, 
                             labels = c("Walking", "Walking Upstairs", 
                                        "Walking Downstairs", "Sitting", 
                                        "Standing", "laying")), 
                             Volunteer_ID = as.factor(train_and_test_data_frame$Volunteer_ID))

#Find the mean of all measurements for each Volunteer and Activity.
Tidy_data <- as.data.frame(summarise_each(group_by(
        train_and_test_data_frame, Volunteer_ID, Activity), funs(mean))) 

#Finally, write out the tidy data set for submission
write.table(Tidy_data, file = "./Tidy_data.txt", row.names = FALSE)
sion

