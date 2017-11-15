
##Information for the script "run_analysis.R"

###Prerequisite R Libraries:
###Some Comment
And a wrong comment

##Testing Pull Request

"plyr"
"data.table"
"reshape"

###Variables that are used in the script:

* src
The source URL of the data files for the dataset

* dest
The destination for the downloaded zip file

* filecheckname
A basic file representing the existence of an unzipped data set

* dldate
Download date, This flags the date that the source data was downloaded if it was downloaded as part of this script

* ActCode
Recycled varible to store the row headings for the data set being worked between test and training

* s2datahead
The column headings file used by both of the test and train data sets

* activityhead
The table that represents a matrix of Activity types (in Number) to the descriptive Activity (text)

* s2dh
The extract of the column names from the headings file sourced in s2datahead into a vector

* s2trrowhead
Import of The row headings table for the training data set

* subjects1
Import of The row headings table for the subjects in the training data set

* s2train
Table of the training data set and reused with column binding by the row headings in "ActCode" and then selecting columns that contain "activity", "mean" or "std" 

* s2terowhead
Import of The row headings table for the testing data set

* s2test
Read table of the testing data set and reused with column binding by the row headings in "ActCode" and then selecting columns that contain "activity", "mean" or "std" 

* subjects2
Import of The row headings table for the subjects in the test data set

*Subject
Recycled varible to store the row headings for the data set being worked between test and training for the Subject being measured

* ActCode
Recycled varible to store the row headings for the data set being worked between test and training for the Activity being measured

* complete
A completed data.table binding s2train and s2test, then using plyr to match the Activity code to the descriptive activity and renoving the Activity code once joined

* coln
The column names used in the complete data.table, this is to ensure that any different interpretation of the "mean" and "std" columns does not depend on Specific column Number references but by names, where the names are not "Activity" as Activity is mandatory

* melted
melts "complete" into a tall table where Activity is the group and the the variables are the row headings "coln"

* cast
recasts the melted table "melted" into a new table passing the "mean" function to the variables to make a table of 6 obs of 80 variables where the variables are the average of each variable for each activity and each subject this is passed to the output generation of "tidy_data.txt"


### Basic description of the stages and processes in the script

#Stage 1: 
Defines the Source data location for the data set and the location where it should be placed

#Stage 2: 
Identifies if any of the data is present either in Zipped or unzipped forms, If the Zip is not available it downloads from "src" and unzips, if the zip is already present it unzips

#Stage 3: 
The data set identifies commen headings and desriptions use din both the training and test data sets so these are read in and defined here. the features table is read in and column 2 is extracted into a single vector to be used as the column headings for the two data sets.  
The Activity matrix is also read in to a table of two columns "ActCode" A code number between 1 and 6, and "Activity" the text description of each of these codes. 

#Stage 4:
Read in both the training and test sets, in both cases the incoming data is given the column headings from the previously defined "s2head" vector
both sections of code read teh appropriate "y Axis" values form the appropriate text file and assign these to the row names for each via a cbind
finally the columns with the name "Activity" or where the columns contain "mean" or "std" are retained and undesired columns discarded

#Stage 5:
The two data sets of training and test are combined in row 59 and reenforced as a data.table
The complete data set then is matched against the activity code in the "activityhead" table to give it the "usable" descriptions before deleting the unusable "activity code"
In case opinion differs on the column definition for mean and std, the actual names of the columns selected are extracted to avoid the danger of integer subsetting (more columns than defined) the known name "Activity" is removed from this vector
the column order is then defined by setting column 1 to "Activity", followed by the rest of the columns captured above

#Stage 6:
Finally the complete table is melted into a tall data set of the Subjects and Activities as the rows and each column heading now as a variable
the columns are also given "tidier" names by a set of setnames statements and the use of gsub for pattern matching (see CodeBook.md for information on the columns)
once melted is recast into a data.table of the means of the selected columns in stage 4 by each activity
the output from this stage is written to a text file "tidy_data.txt" in the working directory




