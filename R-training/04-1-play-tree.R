
## Objective: Check the data (basic, HD, nested level)

## 01 Load Libraries ######
library(tidyverse)

## 02 Load data ######
tree <- read_csv("data/tree.csv")
plot <- read_csv("data/plot.csv")

## 03 main code ######

##
## 3.1 Check the tree data ####
##

## 3.1.1 basic check ####
names(tree)
summary(tree)
table(tree$tree_dbh_class1)

## 3.1.2 HD graph ####
tt <- tree |> filter(!is.na(tree_total_height))
ggplot(tt) + 
  geom_point(aes(x = tree_dbh, y = tree_total_height))

ggplot(tt) + 
  geom_point(aes(x = tree_dbh, y = tree_total_height, color = tree_crown_class))

ggplot(tt) + 
  geom_point(aes(x = tree_dbh, y = tree_total_height, color = as.character(tree_crown_class)))

## !! EX 
## + Create the object 'tt2' from 'tt' and use filter() to keep only:
##   + crown class not 10
##   + height >= 2 (to remove stumps)
## + make a HD graphs with 'tt2', change the color based on `tree_dbh_class1`.
## !! 




## 3.1.3 Check tree in correct plot nested level

## Base R style 
tt3 <- tree
tt3$tree_lvl1_check <- ifelse(
  tt3$tree_dbh < 10 & tt3$tree_distance <= 4, 0, ifelse(
    tt3$tree_dbh < 10 & tt3$tree_distance > 4, 1, NA
  ))

table(tt3$tree_level1_check, useNA = "ifany")

## tidyverse style
tt3 <- tree |>
  mutate(
    tree_level1_check = case_when(
      tree_dbh < 10 & tree_distance <= 4 ~ 0,
      tree_dbh < 10 & tree_distance > 4  ~ 1,
      TRUE ~ NA_integer_
    )
  )
table(tt3$tree_level1_check, useNA = "ifany")


## !! EX
## + Create 'tt4' from 'tt3' and use mutate() and case_when()
##   to calculate `tree_level2_check`, `tree_level3_check` and 
##   `tree_level4_check`
## + create 'tt5' with the outliers filtered out
## !!







