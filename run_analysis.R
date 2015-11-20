## script: run_analysis.R
## created: November 14, 2015

## train dataset should be saved under 'train' directory,
## test dataset should be saved under 'test' directory.

## script steps:
## [1] read activity_labels.txt, features.txt, train dataset, and test dataset
## [2] merge both data sets, train and test
## [3] merge features and labels
## [4] combine all in one data set
## [5] rename variables
## [6] factorized 'subject'
## [7] select variables contain 'mean' or 'std', plus 'subject' and 'activities'
## [8] sort by subject then by activities
## [9] group then mean for all groups

## the script is ran then the produced dataset is saved, as follow:
## x <- run_analysis()
## write.table(x, file = "FUCI_tidy_dataset.txt", row.name=FALSE)
## dataset can be read back using:
## read.table("FUCI_tidy_dataset.txt", header = T)



run_analysis <- function(){
	## first load used library: dplyr
	library(dplyr)
	
	## [1]
	## read "activity_labels.txt" then wrap it a local data table
	l <- read.csv("activity_labels.txt", header = F, sep = " ")
	l <- tbl_df(l)		# train dim() 6 x 2
	
	## read "features.txt", wrap it into a local data table, then remove ()
	f <- read.csv("features.txt", header = F, sep = " ")
	f <- tbl_df(f)		# train dim() 561 x 2
	f <- mutate(f, V2 = gsub("\\()", "", V2))
	
	## read train data set
	## read "train/subject_train.txt"
	s1 <- read.csv("train/subject_train.txt", header = F, sep = " ")
	# train dim() 7352 x 1
		
	## read "train/X_train.txt"
	x1 <- fread("train/X_train.txt")
	# train dim() 7352 x 561

	## read "train/y_train.txt"
	y1 <- fread("train/y_train.txt")
	# train dim() 7352 x 1
	
	## read test data set
	## read "test/subject_test.txt"
	s2 <- read.csv("test/subject_test.txt", header = F, sep = " ")
	# test dim() 2947 x 1
		
	## read "test/X_test.txt"
	x2 <- fread("test/X_test.txt")
	# test dim() 2947 x 561

	## read "test/y_test.txt"
	y2 <- fread("test/y_test.txt")
	# test dim() 2947 x 1
	
	## [2]
	## join both sets, train and test, then wrap each into a local data table
	s <- rbind(s1, s2) %>% tbl_df()
	x <- rbind(x1, x2) %>% tbl_df()
	y <- rbind(y1, y2) %>% tbl_df()
	
	## [3]
	## add labels to y data:
	yl <- left_join(y,l, by = c("V1" = "V1"))
	
	## add features names to X data:
	colnames(x) <- f$V2
	
	## [4]
	## combine all together:
	r <- cbind(s, yl$V2, x) # i.e. subject, activities, measurements
	
	## [5]
	## correct names, rename 'yl.V2' as 'activities', then rename 'V1' as 'subject:
	colnames(r) <- make.names(names=names(r), unique=TRUE, allow_ = F)
	r <- rename (r, activities = yl.V2)
	r <- rename (r, subject = V1)
	
	## add ".ave" to the variables' (columns) names, except "subject" and "activities",
	## (didn't use "mean" to avoid "mean.mean" in variables' names):
	c <- colnames(r)
	colnames(r) <- c("subject", "activities", paste(c[3:length(c)],"ave", sep = "."))
	
	## [6]
	## factorized 'subject'
	r$subject <- factor(r$subject)
	
	## [7]
	## select variables (columns) contain: subject, activities, mean, std:
	cbind(
		select(r, subject),
		select(r, activities),
		select(r, contains("mean")), 
		select(r, contains("std"))
	) %>%
	
	## [8]
	## sort by subject then by activities:
	arrange(subject, activities) %>%
	
	## [9]
	## group then mean for all groups:
	group_by(subject, activities) %>% summarise_each(funs(mean))
	
}


