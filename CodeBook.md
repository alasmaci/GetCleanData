Code Book
========================================================

Data provided for the assignment
------------------------------------------

The data for this assignment were extracted from the Human Activity Recognition database which was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments were carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% for the test data. 

A 561-feature vector with time and frequency domain variables was derived from the data.The vector included a number of estimated variable including Mean value and Standard deviation.

Each record included its activity label and subject identifier. In the data set provided features had been normalized and bounded within [-1,1] so that further data transformations were not required.

Work performed on the provided data
-------------------------------------------

The data for both training and test sets were combined with variable names plus activity and subject identifiers into a single data frame. Variables other than Mean value and Standard deviation were discarded as required by the assignment. Variable names were edited to provide appropriate descriptive names and numeric activity codes were changed to descriptive names leaving one tidy data framewith named columns for all variables both measured and I.D.

It should be noted that there were some variables that appeared to be a mean value but on closer inspection were part of an angle() vector rather a mean of another variable. Consequently those variables were excluded.

The foregoing data set was then manipulated using the melt and dcast functions to create a second, independent tidy data set with the average of each variable for each activity and each subject. 
