#libraries
library(dplyr)

#define function to get mean and SD
get_measurement <- function(arr, my_function){
    c(my_function(arr, na.rm = TRUE))
}

#define function to set label
set_label_factor <- function(label){
    factor(label, levels = c(1, 2, 3, 4, 5, 6), 
           labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING"))
}

## Step one
## Merges the training and the test sets to create one data set.
##Reading dataset test 
test_subject <- read.table("data/test/subject_test.txt")
test_x <- read.table("data/test/X_test.txt")
test_y <- read.table("data/test/y_test.txt")

##Reading dataset train 
train_subject <- read.table("data/train/subject_train.txt")
train_x <- read.table("data/train/X_train.txt")
train_y <- read.table("data/train/y_train.txt")

#merge with rows and define name
subject<- rbind(train_subject, test_subject)
measurements<- rbind(train_x, test_x)
activities<- rbind(train_y, test_y)

## Step two
## Extracts only the measurements on the mean and standard deviation for each measurement.
#calculate average and standar deviation from measurements
dataset<-subject
dataset["mean"]<-apply(measurements, 1, get_measurement, mean)
dataset["sd"]<-apply(measurements, 1, get_measurement, sd)

## Step three
## Uses descriptive activity names to name the activities in the data set
##call set_label_factor function
dataset["activity"]<-apply(activities, 1, set_label_factor)

## Step four
## Appropriately labels the data set with descriptive variable names.
#rename labels
names(dataset) <- c("subject","mean_activity","sd_activity","activity")

## Step five
## From the data set in step 4, creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject.

activity_group<- group_by(dataset, subject, activity)
tidy_dataset<-summarise(activity_group, mean_activity=mean(mean_activity, na.rm = TRUE), 
                        sd_activity= sd(sd_activity,na.rm= TRUE))

#save dataset to file
write.table(tidy_dataset,file="tidy_dataset.csv", row.name=FALSE)

