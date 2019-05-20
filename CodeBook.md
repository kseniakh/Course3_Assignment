## 1. Data overview

The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In the project, the following files were used:
* *features.txt* : A 561-feature vector with time and frequency domain variables. 
* *activity_labels.txt* : The correspondance between activity ids and activity names.
* *test/subject_test.txt* : Each row identifies the subject who performed the activity for each window sample. Its range is between 1 and 30. 
* *test/X_test.txt* : Test set
* *test/y_test.txt* : Test labels
* *train/subject_train.txt* :  Each row identifies the subject who performed the activity for each window sample. Its range is between 1 and 30. 
* *train/X_train.txt* : Training set
* *train/y_train.txt* : Training labels


## 2. Data description

* *y_train* : data.frame that stores data from *y_train.txt*. Consists of 7352 obs of 1 variable (V1). All values are integers between 1 and 6 and correspond to the activities listed in *activity_labels.txt*. The rows correspond to the subjects described in *subject_train.txt*. 
* *X_train* : data.frame that stores data from *X_train.txt*. Consists of 7352 obs of 561 variable (V1,...,V561). The column corresponds to the measuremens obtained for features listed in *features.txt*. The rows correspond to the subjects described in *subject_train.txt*. The values are between -1 and 1. 
* *subject_train* : data.frame that stores data from *subject_train.txt*. Consists of 7352 obs of 1 variable(V1). All values are integers between 1 and 30 and correspond to the subjects performed activity.

* *y_test* : data.frame that stores data from *y_test.txt*. Consists of 2947 obs of 1 variable(V1). All values are integers between 1 and 6 and correspond to the activities listed in *activity_labels.txt*. The rows correspond to the subjects described in *subject_test.txt*. 
* *X_test* : data.frame that stores data from *X_test.txt*. Consists of 2947 obs of 561 variable(V1,...,V561). The columns correspond to the measuremens obtained for features listed in *features.txt*. The rows correspond to the subjects described in *subject_test.txt*. The values are between -1 and 1. 
* *subject_test* : data.frame that stores data from *subject_test.txt*. Consists of 2947 obs of 1 variable (V1). All values are integers between 1 and 30 and correspond to the subjects performed activity.

* *features* -  A data.frame that stores data from *features.txt*. Consists of 561 obs of 2 variables(V1,V2). The first variable V1 is index field. The second variable V2 contains names of features. See *features_info.txt* for the detailes information about feature names.

## 3. Data transformation

1. The *subject_train*,*y_train* and *X_train* data.frames were merged together by the columns. The result data.frame is *train_data*. It consists of 7352 obs. of 563 variables (V1-the subject id,V1.1-the activity id,V1.2,V2..V561- 561 features). 

2. The *subject_test*,*y_test*,*X_test* data.frames were merged together by the columns. The result data.frame is *test_data*. It consists of 2947 obs. of 563 variables (V1-the subject id,V1.1-the activity id,V1.2,V2..V561- 561 features). 

3. The rows from *test_data* were added to *train_data*. The result data.frame is *all_data* consisting of 10299 obs. of 563 variables (V1-the subject id,V1.1-the activity id,V1.2,V2..V561- 561 features). 

4. The data for the measurements on the mean and standard deviation(feature names with mean() and std() measurement) was extracted from *all_data*. The result data.frame is *all_data_subset* consisting of 10299 obs. of 68 variables(V1 - the subject id; V1.1 - the activity id; V1.2, V2-V6, V41-V46, V81-V86, V121-V126, V161-V166, V201, V202, V214, V215, V227, V228, V240, V241, V253, V254, V266-V271, V345-350, V424-V429, V503, V504, V516, V517, V52, V530, V542, V543 - 66 features).

5. The activity ids (V1.1) were substituted by their real names in *all_data_subset*:
  1 -> walking
  2 -> walking_upstairs
  3 -> walking_downstairs
  4 -> sitting
  5 -> standing
  6 -> laying
  
6. Column names in *all_data_subset* were changed to the vector consisting of "subject", "activity" and 66 feature names with mean() and std() measurement. The new names are:


1.subject                    
2.activity                    
3.tBodyAcc-mean()-X          
4.tBodyAcc-mean()-Y           
5.tBodyAcc-mean()-Z           
6.tBodyAcc-std()-X           
7.tBodyAcc-std()-Y            
8.tBodyAcc-std()-Z            
9.tGravityAcc-mean()-X       
10.tGravityAcc-mean()-Y        
11.tGravityAcc-mean()-Z        
12.tGravityAcc-std()-X        
13.tGravityAcc-std()-Y         
14.tGravityAcc-std()-Z         
15.tBodyAccJerk-mean()-X      
16.tBodyAccJerk-mean()-Y       
17.tBodyAccJerk-mean()-Z       
18.tBodyAccJerk-std()-X       
19.tBodyAccJerk-std()-Y       
20.tBodyAccJerk-std()-Z        
21.tBodyGyro-mean()-X       
22.tBodyGyro-mean()-Y          
23.tBodyGyro-mean()-Z          
24.tBodyGyro-std()-X          
25.tBodyGyro-std()-Y           
26.tBodyGyro-std()-Z           
27.tBodyGyroJerk-mean()-X     
28.tBodyGyroJerk-mean()-Y      
29.tBodyGyroJerk-mean()-Z      
30.tBodyGyroJerk-std()-X      
31.tBodyGyroJerk-std()-Y      
32.tBodyGyroJerk-std()-Z       
33.tBodyAccMag-mean()         
34.tBodyAccMag-std()          
35.tGravityAccMag-mean()       
36.tGravityAccMag-std()       
37.tBodyAccJerkMag-mean()      
38.tBodyAccJerkMag-std()       
39.tBodyGyroMag-mean()        
40.tBodyGyroMag-std()         
41.tBodyGyroJerkMag-mean()     
42.tBodyGyroJerkMag-std()     
43.fBodyAcc-mean()-X           
44.fBodyAcc-mean()-Y           
45.fBodyAcc-mean()-Z          
46.fBodyAcc-std()-X            
47.fBodyAcc-std()-Y            
48.fBodyAcc-std()-Z           
49.fBodyAccJerk-mean()-X       
50.fBodyAccJerk-mean()-Y      
51.fBodyAccJerk-mean()-Z      
52.fBodyAccJerk-std()-X       
53.fBodyAccJerk-std()-Y       
54.fBodyAccJerk-std()-Z       
55.fBodyGyro-mean()-X          
56.fBodyGyro-mean()-Y          
57.fBodyGyro-mean()-Z         
58.fBodyGyro-std()-X          
59.fBodyGyro-std()-Y          
60.fBodyGyro-std()-Z          
61.fBodyAccMag-mean()          
62.fBodyAccMag-std()           
63.fBodyBodyAccJerkMag-mean()          
64.fBodyBodyAccJerkMag-std()          
65.fBodyBodyGyroMag-mean()               
66.fBodyBodyGyroMag-std()               
67.fBodyBodyGyroJerkMag-mean()           
68.fBodyBodyGyroJerkMag-std() 

7. A new data.frame *aver_data* with the average of each variable for each activity and each subject was created from all_data_subset. It consists of 180 obs of 68 variables (the variables names are similar to the variables names in previous section for *all_data_subset*). 