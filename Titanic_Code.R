# To read the .csv into a data frame:
df <- read.csv("titanic_original.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
# To find drop the row which has NA for all observations:
df[df$embarked == "", ]
df <- df[-1310,]
# To replace the rows with blank values in df$embarked:
df$embarked[which(df$embarked == "")] <- "S"
# To replace NA values in df$age with the mean of the variable. Median could have also been used:
df$age[which(is.na(df$age))] <- mean(df$age, na.rm = TRUE)
# To set NA values to those which have blank df$boat values:
df$boat[df$boat == ""] = NA
# Creating an index to create one dummy column indicating if the person had a cabin number or not:
df$index <- as.numeric(as.factor(df$cabin))
# The index designated a "1" to every NA in df$cabin. To clean this up, I assigned them to "0", and anything else to "1". 
df$has_cabin_number[which(df$index < 2)] <- 0
df$has_cabin_number[which(df$index > 1)] <- 1
# Dropping the original index column:
df <- df[, -15]
# And finally, writing the finished product to a .csv:
write.csv(df, file = "titanic_clean.csv")
