
_script: run_analysis.R_
_created: November 14, 2015_


### How to run run_analysis.R script:

1. load "dplyr" package, if it is not exist install it first

2. run: source("run_analysis.R")
 and the script should be in current directory

3. 'train' dataset should be saved under 'train' directory,
 and 'test' dataset should be saved under 'test' directory.

4. 3. run: x <- run_analysis()
 
5. the script returns a dataset in 'local data table' format


### Tidy data

+ the output of the run_analysis.R is saved using:
write.table(x, file = "FUCI_tidy_dataset.txt", row.name=FALSE)

+ to load output file use:
y <- read.table("FUCI_tidy_dataset.txt", header = T)


 
