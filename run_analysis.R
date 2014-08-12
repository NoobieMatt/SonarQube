## Set Download Datasource and Destination

#Set Source files 
      src <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      dest <- paste(getwd(),"getdata-projectfiles-UCI HAR Dataset.zip",sep="/")
      filecheckname <- "./UCI HAR Dataset/readme.txt"

#Check File Exists, in correct name, Download if not
      if(!file.exists(filecheckname)){
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

#Define common variables that are used in both data sets 
      s2datahead <- read.table("./UCI HAR Dataset/features.txt", sep ="", header=FALSE, quote="")
      activityhead <- read.table("./UCI HAR Dataset/activity_labels.txt", sep ="", header=FALSE, quote="", col.names=(c("ActCode","Activity")))      
      s2dh <- s2datahead[,2]


#Read In Train

      s2trrowhead <- read.table("./UCI HAR Dataset/train/y_train.txt", sep ="", header=FALSE, quote="", comment.char="", colClasses="integer")
      ActCode <- s2trrowhead[,1]
      s2train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep ="", header=FALSE, quote="", col.names=s2dh)
      s2train <- cbind(ActCode, s2train)
      s2train <- s2train[,grepl("(mean)|(std)|(ActCode)",names(s2train))]

#Read In Test

      s2terowhead <- data.table(read.table("./UCI HAR Dataset/test/y_test.txt", sep ="", header=FALSE, quote="", comment.char="",colClasses="integer"))
      ActCode <- s2terowhead[,1]
      s2test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep ="", header=FALSE, quote="", col.names=s2dh)
      s2test <- cbind(ActCode, s2test)
      s2test <- s2test[,grepl("(mean)|(std)|(ActCode)",names(s2test))]

#Select what we need
 
      library("plyr") #Using plyr here as merge reorders (Thank you David Hood! https://class.coursera.org/getdata-006/forum/thread?thread_id=43)
      library("data.table")
      library("reshape")
      
      complete <- as.data.table(rbind(s2train, s2test))
      complete <- join(complete, activityhead, by = "ActCode")
      complete[,ActCode:=NULL]
      #complete <- complete[,-1] #remove activity code
      coln <- colnames(complete)
      coln <- coln[which(coln != "Activity")]
      setkey(complete)
      setcolorder(complete, c("Activity", coln))
      melted <- as.data.table(melt(complete, id="Activity", measure.vars=coln))
      cast <- dcast.data.table(melted, Activity ~ variable,mean)
      
      #means <- data.frame(colMeans(finalclean))
      write.table(cast, "tidy_data.txt", row.names=FALSE)

