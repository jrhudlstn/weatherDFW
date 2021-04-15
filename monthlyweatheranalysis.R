# Temperature Analysis North Texas 1898-2020
# DFW - Monthly and Annual Average Temperatures
# Author: James Huddleston
# Unsupervised Learning Cluster Analysis
#  This analysis is unsupervised learning using clustering on the D/FW north texas monthly temperatures from 1898-2021 
# for future discovery in weather in north texas. The complete data set is developed by using the years 1899-2020.
# remove any variable that might interfer with my data workspace carried over from a previous running of the program project
rm(list = ls())
file.exists("~/.ssh/id_rsa.pub")
# Library
library(tidyverse)
library(dplyr)
library(devtools)  #  install.packages("devtools")
library(fpp2)
#path=('C:/Users/huddl/OneDrive/DataScienc/weather')
path <- getwd()
setwd(path)
df <- read.csv('dfw1898monthlytemps.csv',  header = TRUE)
#write.csv('')
summary(df)
head(df)
# remove last column 'X' because it has not significant purpose
df = subset(df, select = -c(X) )
df <- na.omit(df)
head(df)
tail(df)
##########################
# plot y= year and x=total
##########################
ggplot(data = df) + geom_point(mapping = aes(x=Year, y=Total))

###################################
# group months into a dataframe 
######################
months_grouped <- df[group_by(Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec)]

################################### frequency is 12 months, 
Y_df <- ts(df[,15], start = c(1900,1), frequency = 12)

autoplot(Y_df)
#devtools::install_github("username/packagename")
#################
# create new dataset with complete months, no NA's
#################

ggplot(data = df2, mapping = aes(x=month, y=year))+ geom_boxplot()




###########End weatherDFWtemps##########################################
#
# retrieve data set https://www.weather.gov/fwd/dmotemp
#
