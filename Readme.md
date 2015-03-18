---
title: "Readme.md"
output: html_document
---

This script will take the data file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip. It is a collection of files using accelerometer data from a Samsung SII. It is collected on 30 "Volunteers" doing six different "Activites". The activities are Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying. These Volunteers are broken up into 21 Training subjects and 7 test subjects.

The object of the script is to create a tidy data set with the mean of all of the mean and standard deviation of the measurements from each Volunteer and their activities.

This is accomplised by reading in the x_train.txt file, which is the measurements. Then the features.txt which is the column labels and applying the labels to the data set. Using the select() function in dplyr and contains(), I select only the variable that are the mean or standard deviation of the measurements. Then the y_train.txt file is read in, which is the Activity as numeric factor. The subject_train.txt is read in a as a numeric "Volunteer_ID".
The ID, Activity and mean/std measurements are then added together in a data frame with the data.frame() funtion.

This is then repeated for the test measurements and the the test and train sets are added together with the rbind() funciton. Column names are added to the Volunteer_ID and Activity variables and mutate() is used to make them factors and add descriptive labels to the numeric Activity variable.

Finally to create the tidy data set of the mean of the selected measurement, group_by() is used to group the Volunteer_ID and Activiy variables and summarize_each is used to calculeate means of all the ungrouped variables. The tide data set is then written out with write.table().