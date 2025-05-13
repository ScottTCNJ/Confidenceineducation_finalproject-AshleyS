
## Project:  SOC 302 Final Multivariate paper
# Located:  Class Folder on Elsa
# File Name: Scott-Trust_Education.R
# Date:      FILL THIS OUT
# Who:       Ashley Scott


####################################################################################
############              Pre-Analysis: settings, packages, and data    ############
####################################################################################


### Settings + Packages
setwd("/courses/SOC302/Scott")

library(dplyr) 
#install.packages("dplyr")
library(psych)

#install.packages("psych")

### Load data 
GSS <- read.csv("GSS2022.csv")

####################################################################################
############              PHASE 1: CLEAN DATA FOR ANALYSIS              ############
####################################################################################


## Steps of cleaning variables Clear vars
# Step 1: Examine variable and coding schema: Table() / summary() 
# Step 2: Recode (if necessary/warrented): mutate(), ifelse(), etc
# Step 3: Confirm: table() / summary()


summary(GSS$coneduc)


############                     DEPENDENT VARIABLE                     ############
############              SUBSTANTIVE VARIABLE NAME HERE                ############

# STEP 1: Examine variable and coding schema 
table(GSS$coneduc)

# STEP 2: Create dummy variables for each category of confidence in edu
GSS <- mutate(GSS, high_cedu = ifelse(coneduc == 1, 1, 0)) 
GSS <- mutate(GSS, medium_cedu = ifelse(coneduc == 2, 1, 0)) 
GSS <- mutate(GSS, low_cedu = ifelse(coneduc == 3, 1, 0)) 

# STEP 3: Confirm creation by looking at coneduc and each dummy variable
table(GSS$coneduc, GSS$high_cedu)
table(GSS$coneduc, GSS$med_cedu)
table(GSS$coneduc, GSS$low_cedu)


############                  INDEPENDENT VARIABLE                    ############
############              SUBSTANTIVE VARIABLE NAME HERE                ############

# STEP 1: Examine variable and coding schema 
table(GSS$degree)
# STEP 2: dmmy variables for each degree
GSS <- mutate(GSS, no_hs = ifelse(degree == 0, 1, 0)) 
GSS <- mutate(GSS, hs = ifelse(degree == 1, 1, 0)) 
GSS <- mutate(GSS, assoc = ifelse(degree == 2, 1, 0)) 
GSS <- mutate(GSS, bach = ifelse(degree == 3, 1, 0)) 
GSS <- mutate(GSS, graduate = ifelse(degree == 4, 1, 0)) 

#variable for any 4-year degree
GSS <- mutate(GSS, college_grad = ifelse(degree >= 3, 1, 0)) 

GSS <- mutate(GSS, grads_and_nohs = ifelse(degree == 0 | degree == 4, 1, 0)) 


# STEP 3: Confirm creation (if necessary)
table(GSS$degree, GSS$no_hs)
table(GSS$degree, GSS$hs)
table(GSS$degree, GSS$assoc)
table(GSS$degree, GSS$bach)
table(GSS$degree, GSS$graduate)

table(GSS$degree, GSS$college_grad)

table(GSS$degree, GSS$grads_and_nohs)

############                  Independent VARIABLE                ############
############                  number of children                  ############
# STEP 1 : examine initial variable 
table(GSS$childs)

# STep 2: Create dummy variables for men and women
GSS <- mutate(GSS, any_child = ifelse(childs > 0, 1, 0))


# Step 3: confirm
table(GSS$childs, GSS$any_child)


############                  Independent VARIABLE                ############
############                  total family income                 ############
# STEP 1 : examine initial variable 
summary(GSS$realinc)

# STep 2: create natural log of income
GSS$lnincome <- log(GSS$realinc)

# step 3 confirm
GSS$test <- log(GSS$realinc) - GSS$lnincome
summary(GSS$test)

############                  Independent VARIABLE                ############
############             subjective class identification          ############
# STEP 1 : examine initial variable 
table(GSS$class)

# STep 2: Create dummy variables for men and women
GSS <- mutate(GSS, Lower_class = ifelse(class == 1, 1, 0))
GSS <- mutate(GSS, Working_class  = ifelse(class == 2, 1, 0))
GSS <- mutate(GSS, Middle_class  = ifelse(class == 3, 1, 0))
GSS <- mutate(GSS, Upper_class = ifelse(class == 4, 1, 0))
GSS <- mutate(GSS, No_class  = ifelse(class == 5, 1, 0))

# Step 3: confirm
table(GSS$class, GSS$Lower_class)
table(GSS$class, GSS$Working_class)
table(GSS$class, GSS$Middle_class)
table(GSS$class, GSS$Upper_class)
table(GSS$class, GSS$No_class)

############                  Independent VARIABLE                ############
############                    college major 1                   ############
# STEP 1 : examine initial variable 
table(GSS$major1)

# STep 2: Create dummy variables for men and women
GSS <- mutate(GSS, STEM = ifelse(major1 %in% c(3, 4, 6, 8, 11, 14, 15, 18, 59, 58, 51, 24, 33, 34, 36, 37, 38, 41, 69, 48, 80, 72, 68, 74, 22, 55), 1, 0))
GSS <- mutate(GSS, NON_STEM = ifelse(major1 %in% c(1, 2, 5, 7, 9, 12, 13, 17, 19, 20, 81, 63, 21, 53, 23, 25, 26, 61, 64, 27, 56, 28, 29, 30, 49, 31, 32, 35, 39, 40, 43, 42, 77, 60, 52, 44, 45, 67, 78, 46, 47, 73, 62, 57, 75, 70, 65, 82, 66, 79, 71, 76, 54, 50), 1, 0))


# Step 3: confirm
table(GSS$major1, GSS$STEM)
table(GSS$major1, GSS$NON_STEM)


############                  Independent VARIABLE                ############
############                    work satisfaction.                ############
# STEP 1 : examine initial variable 
table(GSS$satjob)

# STep 2: Create dummy variables for men and women
GSS <- mutate(GSS, very_satisfied = ifelse(satjob == 1, 1, 0))
GSS <- mutate(GSS, moderatly_satisfied = ifelse(satjob == 2, 1, 0))
GSS <- mutate(GSS, a_little_dissatisfied = ifelse(satjob == 3, 1, 0))
GSS <- mutate(GSS, very_dissatisfied = ifelse(satjob == 4, 1, 0))

# Step 3: confirm
table(GSS$satjob, GSS$very_satisfied)
table(GSS$satjob, GSS$moderatly_satisfied)
table(GSS$satjob, GSS$a_little_dissatisfied)
table(GSS$satjob, GSS$very_dissatisfied)

############                  Independent VARIABLE                ############
############        number words correct in vocabulary test       ############
# STEP 1 : examine initial variable 
table(GSS$wordsum)

# STep 2: leave quant
GSS <- mutate(GSS, wordsum = ifelse(wordsum %in% c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 1, 0))

# Step 3: confirm
table(GSS$wordsum, GSS$wordsum)



####################################################################################
############              PHASE 2: CREATE MY DATASET                    ############
####################################################################################

### STEP 1: Create a list of variables to keep
my_varlist <- c("coneduc", "high_cedu", "medium_cedu", "low_cedu", 
                "degree", "assoc", "bach","graduate", "college_grad",
                "lnincome", "class", "Working_class", "Middle_class", "Upper_class", "childs", "any_child",
                "major1", "STEM", "NON_STEM",
                "satjob", "very_satisfied", "moderatly_satisfied", "a_little_dissatisfied", "very_dissatisfied",
                "wordsum")


### STEP 2: create a new dataset with only your variables and complete case
my_dataset <- GSS %>%
  select(all_of(my_varlist)) %>%
  filter(complete.cases(.))

### STEP 3: Gather Summary Statistics and confirm valid dataset construction
describe(my_dataset)


####################################################################################
############              PHASE 3: Descriptive Statistics     ############
####################################################################################
# TABLE 1: Use describe command for marginal probabilities in Table 1
describe(my_dataset)

####################################################################################
############              PHASE 4: Corilation Matrix                  ############
###################################################################################
# TABLE 2: Correlation between Key IV and DV
cor(my_dataset)

####################################################################################
############              PHASE 4: Regression.                          ############
####################################################################################
# Install and load pscl package for pR2 function
install.packages("pscl")   
library(pscl)              

# model 1: 
model1 <- glm(high_cedu ~ wordsum + satjob + very_satisfied + moderatly_satisfied + a_little_dissatisfied + very_dissatisfied, data = my_dataset, family = binomial)
summary(model1)
pR2(model1)


# model 2:
model2 <- glm(high_cedu ~ childs + lnincome + class + Working_class + Middle_class + Upper_class + No_class, data = my_dataset, family = binomial)
summary(model2)
pR2(model2)

# model 3:
model3 <- glm(high_cedu ~ major1 + STEM + NON_STEM + degree + no_hs + hs + assoc + bach + graduate + college_grad, data = my_dataset, family = binomial)
summary(model3)
pR2(model3)
