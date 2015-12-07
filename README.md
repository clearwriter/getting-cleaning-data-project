# getting-cleaning-data-project
This is the course project for the Getting and Cleaning Data Coursera course. 

Ideally, when complete, the R script -- run_analysis.R -- will do the following:

1. It will download the dataset, assuming that it does not already exist in the working directory.
2. It will load both the activity and feature information.
3. It will load both the training and test datasets. Only those columns which reflect a mean or standard deviation will be kept.
4. It will load the activity and subject data for each dataset, and and then merge those columns with the dataset.
5. It will then merge the two datasets.
6. It converts the activity and subject columns into factors.
7. It creates a tidy dataset of the mean value of each variable for each subject and activity pair.

The end result: The file tidy.txt will be uploaded for review and grading.
