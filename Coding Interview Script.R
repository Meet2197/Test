library(janitor)
library(vtree)
library(dplyr)
library(data.table)

#CSV read 
df <- read.csv(file = 'C:/Users/Meet bhatt/Downloads/DF_for_CInterview.csv')

#Non usable column 

df <- df[,-c(1:93)]

# Age group Categorization

df[df$age <= 14, "age_group"] <- "0-14"
df[df$age > 14 & df$age <= 44, "age_group"] <- "15-44"
df[df$age > 44 & df$age <= 64, "age_group"] <- "45-64"
df[df$age > 64, "age_group"] <- "> 64"

# bmi group Categorization

df[df$BMI <= 18.5, "BMI_group"] <- "0-18.5"
df[df$BMI > 18.5 & df$BMI <= 25, "BMI_group"] <- "18.5-25"
df[df$BMI > 25 & df$BMI <= 30, "BMI_group"] <- "25-30"
df[df$BMI > 30, "BMI_group"] <- "> 30"


# Breakdown of data by subcategory

filter(df,Asthma == 'yes' | age_group>40 | BMI_group<30 | AD_severity_easi  == 'moderate')

# Values with less than 30 BMI and Allergic_rhinitis presence 

filter(df,Allergic_rhinitis == 'yes' | BMI_group > "30" | age_group <60)

# nested subsets of a data frame for evaluation of Arthritis patients in age group and Outcomes evaluation.  

vtree(df, c("Allergic_rhinitis","age_group", "Outcome2"))

# same vtree analysis for Batch with outcomes in what age group with AD_severity 

vtree(df, c("Batch","Outcome1", "AD_severity_easi", "age_group"))