# Intro to Data

install.packages('openintro')

# load package
library(openintro)
library(dplyr)

# data
data(hsb2)

str(hsb2)
glimpse(hsb2)    # dplyr version
?table
table(hsb2$gender)

# %>%   pipe passing vars between functions

# alternatives to subset 
hsb2_public <- hsb2 %>% filter(schtype == 'public')
