# Intro to data - R notes

install.packages('openintro')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('tidyr')

library(dplyr)
library(openintro)

data(hsb2)  # use this syntax to load into environment, don't need the assignment
str(hsb2)

data(email50)
str(email50)
?table
?ifelse


# Calculate median number of characters: med_num_char
med_num_char <- median(email50$num_char)

# Create num_char_cat variable in email50
email50 <- email50 %>%
  mutate(num_char_cat = ifelse(num_char < med_num_char, 'below median', 'at or above median'))

# Count emails in each category
table(email50$num_char_cat)

# Load ggplot2
library(ggplot2)

# Scatterplot of exclaim_mess vs. num_char
ggplot(email50, aes(x = num_char, y = exclaim_mess, color = factor(spam))) +
  geom_point()

library(tidyr)
?count
?spread

# Count number of male and female applicants admitted
ucb_counts <- ucb_admit %>%  count(Admit, Gender)

# View result
ucb_counts

# Spread the output across columns
ucb_counts %>%
  spread(Admit, n)
