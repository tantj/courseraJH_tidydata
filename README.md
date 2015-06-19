--- 
README for run_analysis.R 
author: tantj 
date: 19 June 2015 
output: tidyData.txt 
---

_bold_Project Description 
Course Project for Getting and Cleaning Data by John Hopkins on Coursera. Inputs
a UCI HAR dataset and produces a tidy dataset.

_bold_Functions Used
pkgTest - Called to check for required packages
create_list - Used to generate list of variables and for data assignment.

*Methodology*
1. Checks for dplyr and reshape2 packages. If absent, downloads and installs packages.
2. Asks user for directory where data is stored. Sets the directory as working directory. Creates variables including all data through the function create_list
3. Prepares data for binding by renaming files with Activity and Subject data.
4. Binds Activity and Subject data to main test and train datasets.
5. Test and train datasets are merged using rbind.
6. Extracts only columns that include mean() and std(), discards the rest of the columns.
7. Rename all columns to indicate measurement type. This is done by searching for key labels in features.txt and using it to superimpose naming convention. Naming convention can be found in Codebook.md.
8. Activity ID numbers in column 'Activity' replaced with activity names. 
9. Prepares final output by melting and reshaping data with id.vars = Subject and Activity. Data is then grouped by Subject, Activity and variable so that variable data will be presented for each subject and each activity. The summarise() function is called to produce the final output. 
10. Table is written to the file "tidyData.txt". 