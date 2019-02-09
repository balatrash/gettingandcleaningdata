run_analysis <- function() {

	##load libraries
	library(dplyr)

	##Read Activity Labels and Features

	activitylabels <- read.table("activity_labels.txt",
						col.names = c("activityid","activitylabel"))
	featurelist <- read.table("features.txt",
						col.names = c("featureid","feature"))

	##Mean and STD Measurements only
	meanstdfactor <- grepl(".*-mean\\(\\).*|.*-std\\(\\).*",featurelist$feature)
	filteredlist = featurelist[meanstdfactor,]

	##Tidy the names for col names (remove capital letters, "-" and 
	filteredlist$feature <- tolower(gsub("(\\(\\))|-","",filteredlist$feature))

	##Read training and test data

	traindir <- "./train/"
	trainsubjects <- read.table(paste(traindir,"subject_train.txt",sep =""), col.names = "subjectid")
	trainlabels <- read.table(paste(traindir,"y_train.txt",sep =""), col.names = "activityid")
	trainset <- read.table(paste(traindir,"X_train.txt",sep =""))

	testdir <- "./test/"
	testsubjects <- read.table(paste(testdir,"subject_test.txt",sep =""), col.names = "subjectid")
	testlabels <- read.table(paste(testdir,"y_test.txt",sep =""), col.names = "activityid")
	testset <- read.table(paste(testdir,"X_test.txt",sep =""))

	##Step 2&3: Selecting mean and std measurements only and naming the variables

	trainset <- trainset[,meanstdfactor]
	colnames(trainset) <- filteredlist$feature
	testset <- testset[,meanstdfactor]
	colnames(testset) <- filteredlist$feature	

	##Step 1: 
	##Merging the dfs using cbind() of training and test in the following order 
	##activity - subject - measurments (before selecting the specific measurments

	mergedtrain <- cbind(trainsubjects,trainset)
	mergedtrain <- cbind(trainlabels,mergedtrain)

	mergedtest <- cbind(testsubjects,testset)
	mergedtest <- cbind(testlabels,mergedtest)

	##perform union between the train and test merged datasets

	fullset <- rbind(mergedtest, mergedtrain)

	##Step 4: give the activities their proper label and remove activity id
	clearfullset <- merge(activitylabels,fullset, by = "activityid")
	clearfullset <- clearfullset[,-1]

	##Use sqldf to compute mean of each variable grouped by activitylabel, subject id
	groupedset <- clearfullset
	finalresultset <- groupedset %>% group_by(activitylabel,subjectid) %>% 
				summarise_all(funs(mean)) ##mean of all variables outside group

	##write data to file
	write.table(finalresultset, "./result_set.txt", quote = FALSE, row.names = FALSE, col.names = FALSE)

	
}