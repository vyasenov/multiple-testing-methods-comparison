# set up workspace
rm(list=ls())

setwd('/Users/vyasenov/Library/CloudStorage/OneDrive-Adobe/GitHub/personal/multiple-testing-methods-comparison')

# load libraries
library(skimr)
library(broom)
library(knockoff)
library(hdm)
library(tidyverse)
library(xtable)

# load data
data <- read_csv(file='titanic_dataset.csv')
colnames(data) <- tolower(colnames(data))

# clean data
data <- data %>%
  dplyr::mutate(age = replace(age, is.na(age), 99),
                male = ifelse(sex == 'male', 1, 0),
                cabin = substr(cabin, 1, 1),
                cabin = replace(cabin, is.na(cabin), 'Z')) %>%
  dplyr::select(-c(passengerid, name, ticket, sex))

# one-hot encode string vars
data <- data %>%
  mutate(embarkedC = as.integer(embarked == 'C'),
         embarkedQ = as.integer(embarked == 'Q'),
#         embarkedS = as.integer(embarked == 'S'),
         cabinA = as.integer(cabin == 'A'),
         cabinB = as.integer(cabin == 'B'),
         cabinC = as.integer(cabin == 'C'),
         cabinD = as.integer(cabin == 'D'),
         cabinE = as.integer(cabin == 'E'),
         cabinF = as.integer(cabin == 'F'),
  ) %>%
  dplyr::select(-c(cabin,embarked))

# summarize data
data <- na.omit(data)
dim(data)
skim(data)
