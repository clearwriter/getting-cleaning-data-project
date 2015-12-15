install.packages("plyr")
library(plyr)

# It's always a good idea to start each new project by cleaning up the workspace.
rm(list=ls())

# And we won't get far until we set the working directory to the location 
# where the UCI HAR Dataset was unzipped. 
# Obviously the location will be different on your machine, so replace with your path.
setwd('/Users/abonsig/CourseraR/GetCleanProject/UCI HAR Dataset/');

#####
# Step 1 Instructions:
# Merge the training and test sets to create one data set
#####

# Bring together the train data and test data.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Then we create the X data set by binding X train and test together.
x_data <- rbind(x_train, x_test)

# Then we create the Y data set by binding Y train and test together.
y_data <- rbind(y_train, y_test)

# And finally we create a Subject data set which binds our subject data from earlier.
subject_data <- rbind(subject_train, subject_test)

#####
# Step 2 Instructions:
# Extract only the measurements on the mean and standard deviation for each measurement.
#####

features <- read.table("features.txt")

# And we want to retrieve only columns with mean() or std() in their names.
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subset the desired columns.
x_data <- x_data[, mean_and_std_features]

# Clean up the column names.
names(x_data) <- features[mean_and_std_features, 2]

#####
# Step 3 Instructions:
# Use descriptive activity names to name the activities in the data set.
#####

activities <- read.table("activity_labels.txt")

# Update the values with correct activity names.
y_data[, 1] <- activities[y_data[, 1], 2]

# Clean up the column names.
names(y_data) <- "activity"

#####
# Step 4 Instructions:
# Appropriately label the data set with descriptive variable names.
#####

# Correct the column name.
names(subject_data) <- "subject"

# This is the big step: bind all the data in a single data set.
all_data <- cbind(x_data, y_data, subject_data)

#####
# Step 5 Instruction:
# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject.
#####

# If we look at all_data, we see that the final two columns are Activity and Subject.
# We don't actually need those columns for these purposes.
# Therefore we only need 66 of the 68 columns, 1:66
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# And finally we save it to a tidy data set that we call tidy_data.
write.table(averages_data, "tidy_data.txt", row.name=FALSE)
