##Code book for the "tidy_data.txt" file

The source data for this data set is the Human Activity Recognition Using Smartphones Dataset 
Where the source data has this desription in the Readme.txt file:
*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.*

The Script "run_analysis.R" manipulates this data into a tidy data set with the conditions below.  For more detail on the function of the Script and the output see "ReadMe.MD"

From this data set the two data sets of "test" and "train" were asisgned row and headings from the appropriate "subject_test.txt" and "y_test.txt" files with column headings for both sourced from "features.txt".  All fields in these data sets that did not correspond to Mean or Standard deviation were discarded and combined together to produce a single set before finally changing the names into more readable formats as described below


##Column headings

###Activity
This is the activity performed by the test subject when the measurement was taken:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING


###Time Body Accelerometer meanX	
the Mean(average) of the  measurement from the Accelerometer of the device  capturing body acceleration signals on the X Axis

###Time Body Accelerometer meanY	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Y Axis

###Time Body Accelerometer meanZ	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Z Axiz

###Time Body Accelerometer stdX	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the X Axis

###Time Body Accelerometer stdY	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Y Axis

###Time Body Accelerometer stdZ	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Z Axiz

###Time Gravity Accelerometer meanX	
the Mean(average) of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the X Axis

###Time Gravity Accelerometer meanY	
the Mean(average) of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the Y Axis

###Time Gravity Accelerometer meanZ	
the Mean(average) of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the Z Axiz

###Time Gravity Accelerometer stdX	
The Standard deviation of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the X Axis

###Time Gravity Accelerometer stdY	
The Standard deviation of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the Y Axis

###Time Gravity Accelerometer stdZ	
The Standard deviation of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  on the Z Axiz

###Time Body Accelerometer Jerk meanX	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals  on the X Axis

###Time Body Accelerometer Jerk meanY	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###Time Body Accelerometer Jerk meanZ	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###Time Body Accelerometer Jerk stdX	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the X Axis

###Time Body Accelerometer Jerk stdY	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###Time Body Accelerometer Jerk stdZ	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###Time Body Gyroscope meanX	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the X Axis

###Time Body Gyroscope meanY	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Y Axis

###Time Body Gyroscope meanZ	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Z Axiz

###Time Body Gyroscope stdX	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the X Axis

###Time Body Gyroscope stdY	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Y Axis

###Time Body Gyroscope stdZ	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Z Axiz

###Time Body Gyroscope Jerk meanX	
the Mean(average) of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the X Axis

###Time Body Gyroscope Jerk meanY	
the Mean(average) of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###Time Body Gyroscope Jerk meanZ	
the Mean(average) of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###Time Body Gyroscope Jerk stdX	
The Standard deviation of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the X Axis

###Time Body Gyroscope Jerk stdY	
The Standard deviation of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###Time Body Gyroscope Jerk stdZ	
The Standard deviation of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###Time Body Accelerometer Magnitute mean	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals and the magnitude of those signals

###Time Body Accelerometer Magnitute std	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals and the magnitude of those signals

###Time Gravity Accelerometer Magnitute mean	
the Mean(average) of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  and the magnitude of those signals

###Time Gravity Accelerometer Magnitute std	
The Standard deviation of the  measurement from the Accelerometer of the device capturing the gravity acceleration signals  and the magnitude of those signals

###Time Body Accelerometer Jerk Magnitute mean	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###Time Body Accelerometer Jerk Magnitute std	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###Time Body Gyroscope Magnitute mean	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals and the magnitude of those signals

###Time Body Gyroscope Magnitute std	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals and the magnitude of those signals

###Time Body Gyroscope Jerk Magnitute mean	
the Mean(average) of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###Time Body Gyroscope Jerk Magnitute std	
The Standard deviation of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###FFT Body Accelerometer meanX	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals on the X Axis

###FFT Body Accelerometer meanY	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Y Axis

###FFT Body Accelerometer meanZ	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Z Axiz

###FFT Body Accelerometer stdX	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the X Axis

###FFT Body Accelerometer stdY	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Y Axis

###FFT Body Accelerometer stdZ	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals on the Z Axiz

###FFT Body Accelerometer Jerk meanX	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the X Axis

###FFT Body Accelerometer Jerk meanY	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###FFT Body Accelerometer Jerk meanZ	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###FFT Body Accelerometer Jerk stdX	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the X Axis

###FFT Body Accelerometer Jerk stdY	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Y Axis

###FFT Body Accelerometer Jerk stdZ	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals on the Z Axiz

###FFT Body Gyroscope meanX	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the X Axis

###FFT Body Gyroscope meanY	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Y Axis

###FFT Body Gyroscope meanZ	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Z Axiz

###FFT Body Gyroscope stdX	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the X Axis

###FFT Body Gyroscope stdY	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Y Axis

###FFT Body Gyroscope stdZ	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals on the Z Axiz

###FFT Body Accelerometer Magnitute mean	
the Mean(average) of the  measurement from the Accelerometer of the device capturing body acceleration signals and the magnitude of those signals

###FFT Body Accelerometer Magnitute std	
The Standard deviation of the  measurement from the Accelerometer of the device capturing body acceleration signals and the magnitude of those signals

###FFT BodyBody Accelerometer Jerk Magnitute mean	
the Mean(average) of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###FFT BodyBody Accelerometer Jerk Magnitute std	
The Standard deviation of the  measurement from the Accelerometer of the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###FFT BodyBody Gyroscope Magnitute mean	
the Mean(average) of the  measurement from the Gyroscope in the device capturing body acceleration signals and the magnitude of those signals

###FFT BodyBody Gyroscope Magnitute std	
The Standard deviation of the  measurement from the Gyroscope in the device capturing body acceleration signals and the magnitude of those signals

###FFT BodyBody Gyroscope Jerk Magnitute mean	
the Mean(average) of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals

###FFT BodyBody Gyroscope Jerk Magnitute std	
The Standard deviation of the  measurement from the Gyroscope in the device measuring body linear acceleration and angular velocity in time to obtain "Jerk" signals and the magnitude of those signals
