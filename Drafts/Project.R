# Check for package and loads it if not present
pkgTest <- function(x)
{
  if (!require(x, character.only = TRUE))  {
    install.packages(x,dep=TRUE, repos = "http://star-www.st-andrews.ac.uk/cran/")
    
    if (!require(x, character.only = TRUE)) {
      stop("Package not found")
    } 
  }
}

# Creates list of txt_files to read
create_list <- function(directory) {
  txt_files <- list.files(directory, pattern = "[a-zA-Z]+.txt", recursive = TRUE)
  txt_files <- txt_files[-grep("(Inertial?)+", txt_files)]
  txt_files <- txt_files[-grep("(README?)+", txt_files)]
  txt_files <- txt_files[-grep("(info?)+", txt_files)]
  txt_files
}

# Start here
pkgTest("dplyr")
pkgTest("reshape2")

# Creates global variables by reading txt files into tables
cat("What's your directory? Type a single period for current directory. (Do not include quotation marks)")
directory <- readLines(con = stdin(), 1)
txt_files <- create_list(directory) 
filenames <- as.character(gsub(".txt", "", txt_files))
filenames <- as.character(gsub("/", "_", filenames))
i <- 1
for (item in txt_files) {
 assign(paste0(filenames[i]), read.table(as.character(item)))
 i <- i + 1
}

# Rename column names of activity and subject to prepare for merging
names(test_y_test) <- "Activity"
names(test_subject_test) <- "Subject"
names(train_y_train) <- "Activity"
names(train_subject_train) <- "Subject"

# Create column for Type (Test / Training)
#tobind_test <- data.frame()
#tobind_test[1:nrow(test_X_test), "Type"] <- "Test"
#tobind_train <- data.frame()
#tobind_train[1:nrow(train_X_train), "Type"] <- "Training"

# Append Type, Activity and Subject columns
#test_X_test <- cbind(tobind_test, test_subject_test, test_y_test, test_X_test)
#train_X_train <- cbind(tobind_train, train_subject_train, train_y_train, train_X_train)
test_X_test <- cbind(test_subject_test, test_y_test, test_X_test)
train_X_train <- cbind(train_subject_train, train_y_train, train_X_train)

# Merge Test and Train data frames
if (ncol(test_X_test) == ncol(train_X_train)) {
  mergedTT <- rbind(test_X_test, train_X_train)
} else {
  stop("Data frames have different number of columns")
}

# Look through features to find mean and std
toextract <- grep("mean\\(\\)|std\\(\\)", features$V2)
toextract_bind <- c("Subject", "Activity", paste("V", toextract, sep = ""))
toextract_colnames <- as.character(features[toextract, 2])
 
# Keep mean and std columns, remove the rest
mergedTT <- mergedTT[, toextract_bind]

# Rename features 
for (i in 1:length(toextract_colnames)) {
  label_signal <- label_type <- label_acc <- label_jerk <- label_mag <- label_ms <- ""
  
  if (grepl("^t", toextract_colnames[i])) {
    label_signal <- "Time"
  } else {
    label_signal <- "Freq"
  }
  
  if (grepl("Body", toextract_colnames[i])) {
    label_type <- "_Body"
  } else {
    label_type <- "_Grav"
  }
  
  if (grepl("Acc", toextract_colnames[i])) {
    label_acc <- "_Acc"
  } else {
    label_acc <- "_Gyro"
  }
  
  if (grepl("Jerk", toextract_colnames[i])) {
    label_jerk <- "_Jerk"
  } else {
    label_jerk <- ""
  }
  
  if (grepl("Mag", toextract_colnames[i])) {
    label_mag <- "_Mag"
  } else{
    label_mag <- ""
  }
  
  if (grepl("mean", toextract_colnames[i])) {
    label_ms <- "_mean"
  } else if (grepl("std", toextract_colnames[i])) {
    label_ms <- "_std"
  }
  
  if (grepl("X", toextract_colnames[i])) {
    label_dim <- "_X"
  } else if (grepl("Y", toextract_colnames[i])) {
    label_dim <- "_Y"
  } else if (grepl("Z", toextract_colnames[i])) {
    label_dim <- "_Z"
  }
  
  toextract_colnames[i] <- paste(label_signal, label_type, label_acc, label_jerk, label_mag, label_ms, label_dim, sep = "")
}
toextract_colnames <- c("Subject", "Activity", toextract_colnames)
if (length(toextract_colnames) == ncol(mergedTT)) {
  names(mergedTT) <- toextract_colnames
} else {
  stop("Different number of column names")
}

# Replace Activity column with labels
for (i in 1:nrow(mergedTT)) {
  m <- match(mergedTT$Activity[i], activity_labels$V1)
  mergedTT$Activity[i] <- as.character(activity_labels$V2[m])
}

# Melts data to form four columns
tidyData <- melt(mergedTT, id.vars = c("Subject", "Activity"))
tidyData <- group_by(tidyData, Subject, Activity, variable)
tidyData <- summarise(tidyData, mean = mean(value))

write.table(tidyData, "tidyData.txt", row.names = FALSE)
