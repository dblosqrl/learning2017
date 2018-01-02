# Datacamp dplyr

install.packages('hflights')

library(dplyr)
library(hflights)


# tibble is a special kind of data frame that is easier to look at
hflights <- tbl_df(hflights)

# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental", 
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways", 
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier", 
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Add the Carrier column to hflights
hflights$Carrier <- lut[hflights$UniqueCarrier]  
# way of implementing a lookup table, will insert NA to implement left join

# Glimpse at hflights
glimpse(hflights)

unique(hflights$CancellationCode)

# Select - select columns
# Filter - select rows
# Arrange - sort by specified fields
# Mutate - create calculated fields
# Summarize
# only after data is already tidy-ed!

names(hflights)
# Print out a tbl with the four columns of hflights related to delay
hflights %>% select(10:13)

# Helper functions for variable selection
# dplyr comes with a set of helper functions that can help you select groups of variables inside a select() call:
  
#  starts_with("X"): every name that starts with "X",
#ends_with("X"): every name that ends with "X",
#contains("X"): every name that contains "X",
#matches("X"): every name that matches "X", where "X" can be a regular expression,
#num_range("x", 1:5): the variables named x01, x02, x03, x04 and x05,
#one_of(x): every name that appears in x, which should be a character vector?.


hflights %>% select(matches('Time|Delay'))

# mutate - new vars out of existing
# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)
#sum(g2$ActualGroundTime != g2$GroundTime, na.rm = TRUE)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance / AirTime * 60)

# Print out g3
glimpse(g3)


#--------------------

# Filter - the row version of select

?Comparison

# figure out data set - is weekend 6,7 or 1,7?  - 6 = Saturday
table(hflights$DayOfWeek)
filter(hflights, Year == 2011, Month == 1, DayofMonth ==1) %>% select(DayOfWeek)

filter(hflights, Distance > 1000, TaxiIn+TaxiOut<15, DayOfWeek %in% c(6,7))


# Make an ordered per-carrier summary of hflights
hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(p_canc = sum(Cancelled) / n() * 100,
            avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
  arrange(avg_delay, p_canc)


# Working with databases

library(data.table)
hflights2 <- as.data.table(hflights)


# Set up a connection to the mysql database
my_db <- src_mysql(dbname = "dplyr", 
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com", 
                   port = 3306, 
                   user = "student",
                   password = "datacamp")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
  group_by(carrier)  %>%
  summarize(n_flights = n(), avg_delay = mean(arr_delay, na.rm = TRUE))  %>%
  arrange(avg_delay)
