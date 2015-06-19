--- 
Codebook for run_analysis.R 
author: tantj 
date: 19 June 2015 
output: tidyData.txt 
---

_bold_Project Description 
Course Project for Getting and Cleaning Data by John Hopkins on Coursera. Inputs
a UCI HAR dataset and produces a tidy dataset.

_bold_Raw Data 
Original data included 561 variables. This list was pared down to
include only mean and standard deviation data, producing 66 variables. The final
output is tidyData.txt, with 4 columns and 11880 rows. The columns and variables
are described in this codebook.

_bold_Columns
Subject: ID number of subject performing the experiment
Activity: Experiment type. Six activity types were used for the experiment:
LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS
variable: Measurement type. Variables will be listed and explained below.
mean: Average of measurements for each variable.

_bold_Labels for Variables
The variables in this dataset were named using a standard convention that
indicate the type of test that was performed. These labels can be divided into 7
types. Labels marked optional are only applied where relevant.
1. Signal type
Time - Time domain signal
Freq - Frequency domain signal

2. Acceleration type
Body - Body acceleration signal
Grav - Gravity acceleration signal

3. Source
Acc - From Accelerometer
Gyro - From Gyroscope

4. Jerk Signal (optional)
Jerk - Jerk signal derived from body linear acceleration and angular velocity

5. Magnitude (optional)
Mag - Indicates that measurements refer to magnitude of three-dimensional signal
(using Euclidean norm)

6. Mean/Std
mean - Indicates that value is an average of the mean outcome
std - Indicates that value is an average of the standard deviation of the
measurements.

7. Dimension
X / Y / Z - indicates the direction of signal measured

_bold_Variable list
"1" "Time_Body_Acc_mean_X"
"2" "Time_Body_Acc_mean_Y"
"3" "Time_Body_Acc_mean_Z"
"4" "Time_Body_Acc_std_X"
"5" "Time_Body_Acc_std_Y"
"6" "Time_Body_Acc_std_Z"
"7" "Time_Grav_Acc_mean_X"
"8" "Time_Grav_Acc_mean_Y"
"9" "Time_Grav_Acc_mean_Z"
"10" "Time_Grav_Acc_std_X"
"11" "Time_Grav_Acc_std_Y"
"12" "Time_Grav_Acc_std_Z"
"13" "Time_Body_Acc_Jerk_mean_X"
"14" "Time_Body_Acc_Jerk_mean_Y"
"15" "Time_Body_Acc_Jerk_mean_Z"
"16" "Time_Body_Acc_Jerk_std_X"
"17" "Time_Body_Acc_Jerk_std_Y"
"18" "Time_Body_Acc_Jerk_std_Z"
"19" "Time_Body_Gyro_mean_X"
"20" "Time_Body_Gyro_mean_Y"
"21" "Time_Body_Gyro_mean_Z"
"22" "Time_Body_Gyro_std_X"
"23" "Time_Body_Gyro_std_Y"
"24" "Time_Body_Gyro_std_Z"
"25" "Time_Body_Gyro_Jerk_mean_X"
"26" "Time_Body_Gyro_Jerk_mean_Y"
"27" "Time_Body_Gyro_Jerk_mean_Z"
"28" "Time_Body_Gyro_Jerk_std_X"
"29" "Time_Body_Gyro_Jerk_std_Y"
"30" "Time_Body_Gyro_Jerk_std_Z"
"31" "Time_Body_Acc_Mag_mean_Z"
"32" "Time_Body_Acc_Mag_std_Z"
"33" "Time_Grav_Acc_Mag_mean_Z"
"34" "Time_Grav_Acc_Mag_std_Z"
"35" "Time_Body_Acc_Jerk_Mag_mean_Z"
"36" "Time_Body_Acc_Jerk_Mag_std_Z"
"37" "Time_Body_Gyro_Mag_mean_Z"
"38" "Time_Body_Gyro_Mag_std_Z"
"39" "Time_Body_Gyro_Jerk_Mag_mean_Z"
"40" "Time_Body_Gyro_Jerk_Mag_std_Z"
"41" "Freq_Body_Acc_mean_X"
"42" "Freq_Body_Acc_mean_Y"
"43" "Freq_Body_Acc_mean_Z"
"44" "Freq_Body_Acc_std_X"
"45" "Freq_Body_Acc_std_Y"
"46" "Freq_Body_Acc_std_Z"
"47" "Freq_Body_Acc_Jerk_mean_X"
"48" "Freq_Body_Acc_Jerk_mean_Y"
"49" "Freq_Body_Acc_Jerk_mean_Z"
"50" "Freq_Body_Acc_Jerk_std_X"
"51" "Freq_Body_Acc_Jerk_std_Y"
"52" "Freq_Body_Acc_Jerk_std_Z"
"53" "Freq_Body_Gyro_mean_X"
"54" "Freq_Body_Gyro_mean_Y"
"55" "Freq_Body_Gyro_mean_Z"
"56" "Freq_Body_Gyro_std_X"
"57" "Freq_Body_Gyro_std_Y"
"58" "Freq_Body_Gyro_std_Z"
"59" "Freq_Body_Acc_Mag_mean_Z"
"60" "Freq_Body_Acc_Mag_std_Z"
"61" "Freq_Body_Acc_Jerk_Mag_mean_Z"
"62" "Freq_Body_Acc_Jerk_Mag_std_Z"
"63" "Freq_Body_Gyro_Mag_mean_Z"
"64" "Freq_Body_Gyro_Mag_std_Z"
"65" "Freq_Body_Gyro_Jerk_Mag_mean_Z"
"66" "Freq_Body_Gyro_Jerk_Mag_std_Z"

