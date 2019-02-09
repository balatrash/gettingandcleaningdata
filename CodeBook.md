# Getting and Cleaning Data - Programming Assignment Code Book

## Functions
- read.table(): to read the data from .txt files
- grepl(): to produce a binary factor vector to filter out required variables (mean, std)
- tolower() and gsub(): to set all characters of the variable names to lower case and to remove "()" and "-"
- colnames(): to rename the columns of a df
- cbind(): to bind dfs column wise
- rbind(): to bind dfs row wise
- merge(): to perform joins between datasets
- dplyr functions:
-- group_by(): to group by data sets according to one or more variable
--summarise_all(): to perform a function on all non-group variables

## Data Set Variables (Unchanged)

- activitylabels: contains the data of "activity_labels.txt" with proper column names
- featurelist: contains the data of "features.txt" with proper column names
- trainsubjects: contains the data of "subject_train.txt" with proper column names
- trainlabels: contains the data of "y_train.txt" with proper column names
- trainset: contains the data of "X_train.txt" with proper column names (will appear late in transformed variables)
- testsubjects: contains the data of "subject_test.txt" with proper column names
- testlabels: contains the data of "y_test.txt" with proper column names
- testset: contains the data of "X_test.txt" with proper column names (will appear later in transformed variables)

## Transformation and Manipulation Variables:

- meanstdfactor: contains the results of grepl() on *featurelist*
- filteredlist: filtered *featurelist* based on *meanstdfactor*
- trainset: filtered *trainset* based on *meanstdfactor* and given the proper variable names based on *filteredlist*
- testset: filtered *trainset* based on *meanstdfactor* and given the proper variable names based on *filteredlist*
- mergedtrain: cbind() between *trainlabels*, *trainsubjects* and *trainset*
- mergedtest: cbind() between *testlabels*, *testsubjects* and *testset*
- fullset: rbind() between *mergedtest* and *mergedtrain*
- clearfullset: result of merge() between *activitylabels* and *fullset* which gives the proper lables to activities in the merged set
- groupedset: copy of *clearfullset* to keep it intact
- finalresultset: contains the result of group_by and summarise_all(funs(mean))


## Files

- result_set.txt: a text file containing the finalresultset without colnames or rownames