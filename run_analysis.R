## Stage 1
## Set Download Datasource and Destination

## Set files 
      src <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      dest <- paste(getwd(),"getdata-projectfiles-UCI HAR Dataset.zip",sep="/")
      filecheckname <- "./UCI HAR Dataset/readme.txt"

      
## Stage 2
## File existence checks

      if(!file.exists(filecheckname)){ #See if the folder structure doesnt exist
            message("No folder structure found")
            
            if(!file.exists(dest)){ 
                  message("No Source Zip found")
                  download.file(src, dest)
                  dldate <- date() 
                  unzip(dest)
            } else {
                  message("UCI HAR Dataset.zip file found, unzipping")
                  unzip(dest)
            }     
      } else {
      message("Readme file is found, assume this validates existence of the full data set, we would like to be more precise here but for the purposes of illustration I believe this is sufficient")
      }

## Stage 3
## Define common variables that are used in both data sets 
      
      s2datahead <- read.table("./UCI HAR Dataset/features.txt", sep ="", header=FALSE, quote="")
      activityhead <- read.table("./UCI HAR Dataset/activity_labels.txt", sep ="", header=FALSE, quote="", col.names=(c("ActCode","Activity")))      
      s2dh <- s2datahead[,2]

## Stage 4
## Read in Source data
      ##Read In Training      
            #Get the Activity codes
            s2trrowhead <- read.table("./UCI HAR Dataset/train/y_train.txt", sep ="", header=FALSE, quote="", comment.char="", colClasses="integer")
            ActCode <- s2trrowhead[,1]
            #Get the Subject numbers
            subjects1 <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep ="", header=FALSE, quote="", comment.char="", colClasses="integer")
            Subject <- subjects1[,1]
      
            s2train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep ="", header=FALSE, quote="", col.names=s2dh)
            s2train <- cbind(Subject, ActCode, s2train)
            s2train <- s2train[,grepl("(\\.mean\\.\\.)|(\\.std\\.\\.)|(ActCode)|(Subject)",names(s2train))]
      
      #Read In Test
            s2terowhead <- read.table("./UCI HAR Dataset/test/y_test.txt", sep ="", header=FALSE, quote="", comment.char="",colClasses="integer")
            ActCode <- s2terowhead[,1]
            #Get the Subject numbers
            subjects2 <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep ="", header=FALSE, quote="", comment.char="", colClasses="integer")
            Subject <- subjects2[,1]
            #Create test table      
            s2test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep ="", header=FALSE, quote="", col.names=s2dh)
            s2test <- cbind(Subject, ActCode, s2test)
            s2test <- s2test[,grepl("(\\.mean\\.\\.)|(\\.std\\.\\.)|(ActCode)|(Subject)",names(s2test))]

##Stage 5 reassembly
##
 
      library("plyr") #Using plyr here as merge reorders (Thank you David Hood! https://class.coursera.org/getdata-006/forum/thread?thread_id=43)
      library("data.table")
      library("reshape")
      
      complete <- as.data.table(rbind(s2train, s2test))
      complete <- join(complete, activityhead, by = "ActCode")
      complete[,ActCode:=NULL]
      coln <- colnames(complete)
      coln <- coln[which(coln != "Activity")]
      coln <- coln[which(coln != "Subject")]
      setkey(complete)
      setcolorder(complete, c("Subject", "Activity", coln))
      
## Stage 6
## Reshape data
      
      melted <- as.data.table(melt(complete, id=c("Subject","Activity"), measure.vars=coln))
      
      cast <- dcast.data.table(melted, Subject + Activity ~ variable,mean)
      
      #Tidy up the Column Names to make them simpler to read
      setnames(cast,names(cast),gsub("\\.","",names(cast))) #Remove "."'s
      setnames(cast,names(cast),gsub("BodyGyro","Body Gyroscope ",names(cast)))
      setnames(cast,names(cast),gsub("BodyAcc","Body Accelerometer ",names(cast)))
      setnames(cast,names(cast),gsub("GravityAcc","Gravity Accelerometer ",names(cast)))
      setnames(cast,names(cast),gsub("^t","Time ",names(cast)))
      setnames(cast,names(cast),gsub("^f","FFT ",names(cast)))
      setnames(cast,names(cast),gsub("Jerk","Jerk ",names(cast)))
      setnames(cast,names(cast),gsub("Mag","Magnitute ",names(cast)))

      
      write.table(cast, "tidy_data.txt", row.names=FALSE)

      write.csv(cast, "dump.csv")
