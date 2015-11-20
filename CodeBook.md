## Code book for UCI HAR Dataset


### Row Data

* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training dataset.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt' & 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


### Processed data

_data is processed in concise steps to minimize the required mainuplation and_
_to obtain a tidy data in small number of steps_

1. Merge 'train' and 'test' datasets
	+ 'train/X_train.txt' and 'test/X_test.txt' are merged together, then
	+ 'train/y_train.txt' and 'test/y_test.txt' are meget together, then
	+ 'train/subject_train.txt' and 'test/subject_train.txt' are meget together.

2. Variables names from 'features.txt' are assigned to dataset produced from step (1).

3. Activities labels from 'activity_labels.txt' are merged to dataset produced from step (2).

4. All variables are renamed to proper names.

5. 'subject' variable is coerced to a factor.

6. Variables have 'mean' or 'std' are kept the rest are eliminated.

7. Dataset is sorted by 'subject' then by 'activities'

8. Dataset is grouped by 'subject' and 'activities' then 'mean' is calculated for each 
 subject_activity group.

9. Dataset should look like:

	subject | activities | tBodyAcc.mean.X | tBodyAcc.mean.Y :::
	--------|------------|-----------------|---------------- :::
	1		| STANDING	 | 0.28858451	   | -0.020294171
	1		| LAYING	 | 0.18047854	   | -0.042535659
	:::
	
10. Here are the definition and complete list of variables:

tAcc-XYZ and tGyro-XYZ: come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

tBodyAcc-XYZ and tGravityAcc-XYZ: came from the acceleration signal, which separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
	
tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ: are the body linear acceleration and angular velocity derived in time to obtain Jerk signals.

tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag: are the magnitude of these three-dimensional signals calculated using the Euclidean norm.

fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag: are Fast Fourier Transform (FFT) applied to some signals.

mean(), Mean value, and std(), Standard deviation: are estimated from these signals

```{r tidy=FALSE}
subject
activities
tBodyAcc.mean.X
tBodyAcc.mean.Y
tBodyAcc.mean.Z
tGravityAcc.mean.X
tGravityAcc.mean.Y
tGravityAcc.mean.Z
tBodyAccJerk.mean.X
tBodyAccJerk.mean.Y
tBodyAccJerk.mean.Z
tBodyGyro.mean.X
tBodyGyro.mean.Y
tBodyGyro.mean.Z
tBodyGyroJerk.mean.X
tBodyGyroJerk.mean.Y
tBodyGyroJerk.mean.Z
tBodyAccMag.mean
tGravityAccMag.mean
tBodyAccJerkMag.mean
tBodyGyroMag.mean
tBodyGyroJerkMag.mean
fBodyAcc.mean.X
fBodyAcc.mean.Y
fBodyAcc.mean.Z
fBodyAcc.meanFreq.X
fBodyAcc.meanFreq.Y
fBodyAcc.meanFreq.Z
fBodyAccJerk.mean.X
fBodyAccJerk.mean.Y
fBodyAccJerk.mean.Z
fBodyAccJerk.meanFreq.X
fBodyAccJerk.meanFreq.Y
fBodyAccJerk.meanFreq.Z
fBodyGyro.mean.X
fBodyGyro.mean.Y
fBodyGyro.mean.Z
fBodyGyro.meanFreq.X
fBodyGyro.meanFreq.Y
fBodyGyro.meanFreq.Z
fBodyAccMag.mean
fBodyAccMag.meanFreq
fBodyBodyAccJerkMag.mean
fBodyBodyAccJerkMag.meanFreq
fBodyBodyGyroMag.mean
fBodyBodyGyroMag.meanFreq
fBodyBodyGyroJerkMag.mean
fBodyBodyGyroJerkMag.meanFreq
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.
tBodyAcc.std.X
tBodyAcc.std.Y
tBodyAcc.std.Z
tGravityAcc.std.X
tGravityAcc.std.Y
tGravityAcc.std.Z
tBodyAccJerk.std.X
tBodyAccJerk.std.Y
tBodyAccJerk.std.Z
tBodyGyro.std.X
tBodyGyro.std.Y
tBodyGyro.std.Z
tBodyGyroJerk.std.X
tBodyGyroJerk.std.Y
tBodyGyroJerk.std.Z
tBodyAccMag.std
tGravityAccMag.std
tBodyAccJerkMag.std
tBodyGyroMag.std
tBodyGyroJerkMag.std
fBodyAcc.std.X
fBodyAcc.std.Y
fBodyAcc.std.Z
fBodyAccJerk.std.X
fBodyAccJerk.std.Y
fBodyAccJerk.std.Z
fBodyGyro.std.X
fBodyGyro.std.Y
fBodyGyro.std.Z
fBodyAccMag.std
fBodyBodyAccJerkMag.std
fBodyBodyGyroMag.std
fBodyBodyGyroJerkMag.std
```
	
