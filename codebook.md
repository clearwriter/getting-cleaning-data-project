# Introduction to the Code Book

The script `run_analysis.R` performs the five steps outlined in instructions for the course project.

* First, we use the `rbind()` function to merge all the similar data. 
* Only those columns with mean and standard deviation measures are taken from the whole dataset. These columns are then assigned the correct names, taken from `features.txt`.
* Activity data is assigned values 1:6. The activity names and IDs from `activity_labels.txt` are substituted in the dataset.
* The data is appropriately labeled.
* The ultimate outcome is to generate a new dataset with all the average measures for each subject and activity type. 30 subjects, 6 activites = 180 rows. The output file, `tidy.txt`, is uploaded to this repository.

# Variables

* Data from the downloaded files: `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` 
* Merge the datasets for further analysis: `x_data`, `y_data` and `subject_data` 
* `features` contains the correct names for the `x_data` dataset
* Column names are stored in `mean_and_std_features`
* A similar approach is taken with activity names through the `activities` variable.
* `all_data` merges `x_data`, `y_data` and `subject_data` in one consolidated dataset
* Relevant averages are stored in `averages_data` which provides the source for the `tidy.txt` file
* `ddply()` from the plyr package is used to apply `colMeans()` and ease the development
