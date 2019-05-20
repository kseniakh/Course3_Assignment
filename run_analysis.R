zip_file="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# create folder with data

if(!file.exists("data")) {dir.create("data")}
download.file(zip_file, destfile = "./data/datasets.zip", method = "curl")

#unzip datasets.zip before proceeding with the next lines!! 

#getting data

y_train<-read.table(".\\data\\datasets\\UCI HAR Dataset\\train\\y_train.txt")
X_train<-read.table(".\\data\\datasets\\UCI HAR Dataset\\train\\X_train.txt")
subject_train<-read.table(".\\data\\datasets\\UCI HAR Dataset\\train\\subject_train.txt")

y_test<-read.table(".\\data\\datasets\\UCI HAR Dataset\\test\\y_test.txt")
X_test<-read.table(".\\data\\datasets\\UCI HAR Dataset\\test\\X_test.txt")
subject_test<-read.table(".\\data\\datasets\\UCI HAR Dataset\\test\\subject_test.txt")

features<-read.table(".\\data\\datasets\\UCI HAR Dataset\\features.txt")


# 1. Merges the training and the test sets to create one data set.

train_data<-cbind(subject_train,y_train,X_train)
test_data<-cbind(subject_test,y_test,X_test)

all_data<-rbind(train_data,test_data)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std_ind<-grep(".*(mean|std)\\(\\).*", features$V2)
names<-grep(".*(mean|std)\\(\\).*", features$V2,value = TRUE)

mean_std_ind<-mean_std_ind+2

all_data_subset<-all_data[,c(1,2,mean_std_ind)]
features_all_data_subset<-(c("subject","activity",names))

# 3. Uses descriptive activity names to name the activities in the data set
all_data_subset$V1.1<-sub("1","walking",all_data_subset$V1.1)
all_data_subset$V1.1<-sub("2","walking_upstairs",all_data_subset$V1.1)
all_data_subset$V1.1<-sub("3","walking_downstairs",all_data_subset$V1.1)
all_data_subset$V1.1<-sub("4","sitting",all_data_subset$V1.1)
all_data_subset$V1.1<-sub("5","standing",all_data_subset$V1.1)
all_data_subset$V1.1<-sub("6","laying",all_data_subset$V1.1)


# 4. Appropriately labels the data set with descriptive variable names.
colnames(all_data_subset)<-features_all_data_subset

# 5. From the data set in step 4, create a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

library(reshape2)

melt_data<-melt(all_data_subset,id=features_all_data_subset[1:2],measure.vars=features_all_data_subset[3:length(features_all_data_subset)])
aver_data<-dcast(melt_data,subject+activity~variable,mean)

#6. save dataset

write.table(aver_data,file="./final_dataset.txt",sep="\t", row.name=FALSE)
