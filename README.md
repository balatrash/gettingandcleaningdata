# Getting and Cleaning Data - Programming Assignment

## Steps
- Step0: Read the training and the test sets.
- Step1: Merges the training and the test sets to create one data set.
- Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
- Step3: Uses descriptive activity names to name the activities in the data set.
- Step4: Appropriately labels the data set with descriptive variable names.
- Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
## Algortihm (Shuffeled Steps)

The steps were not perfomed in the above order. Instead they were performed in the following order: 0 > 2 > 3 > 1 > 4 > 5. The reason behind this is for the ease of performing the steps in this manner. Below you will see how the flow of the code works and what is expected at each level/step. Plus the code is commented, detailing each of the above steps through the code.

## Flow

- Read the activity labels and variable names. Filter out the variables that are not mean or std and clean their names by removing the "-" and "()" from the string
- Read the training and test data sets: X_train, y_train, subject_train and X_test, y_test, subject_test (step 0 complete)
- Filter out unwanted columns from X_train and X_test according the wanted variables and naming the columns with the proper name (step 2 and 3 complete)
- Column bind subject_train, y_train and X_train (filtered)
- Column bind subject_test, y_test and X_test (filtered) 
- Row bind between the above 2 sets (Step 1 complete)
- Assign the proper label to the activity column in the merged data sets (Step 4 Completed)
- Use dplyr package and pipelining to compute the mean of the 66 variables group by activity label and subject ID
- Write data to a file with out column or row names (Step 5 completed)

## Reference

For more reference you can check CodeBook.md which contains a detailed documentation of all the functions and variables used in the code.