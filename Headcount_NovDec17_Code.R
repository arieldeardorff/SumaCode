Ariel Deardorff, UCSF Library
January 5, 2017

#The goal of this code is to tranform raw SUMA data into a format that is more easily readable in Tableau.

# Note: you first need to get rid of the empty rows and duplicate header rows in excel. Working on how to do this with the scripts as well!

data <- read.csv("Headcount_NovDec17_Raw.csv", header = TRUE, na.strings = c(" ","NA"))

#load packages
library(reshape2)
library(dplyr)
library(tidyr)

#melt data from the first 6 columns
data_melt <- melt(data, id=c(1:6), na.rm = TRUE, value.name = "Count")

# change empty cells to NA
data_melt$Count[data_melt$Count==""] <- NA

#omit NA cells 
data_melt <- na.omit(data_melt)

#separate variable column into two new column on the tenth character
data_melt <- separate(data_melt, variable, c("Activity","Seating"), sep= 10, remove = FALSE, fill = "right")

write.csv(data_melt, file="Headcount_NovDec17_Final.csv")
