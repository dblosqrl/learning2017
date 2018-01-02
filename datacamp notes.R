# DataCamp Intro to R notes - 26 Dec 17

# Names, Vectors, Matrices, Factors, dataframes


my_var <- c(6,3,4)
class(my_var)

names(my_var) <- c('a','b','c')

names(my_var)[3]
names(my_var)[c(1,3)]

star_wars_matrix <- matrix(1:9, byrow = TRUE, nrow = 3)
rownames(star_wars_matrix) <- c('a', 'b', 'c')
colnames(star_wars_matrix) <- c('1', '2', '3')
rowSums(star_wars_matrix)    # why on earth is Sums capitalized???
new_mat <- cbind(star_wars_matrix, c(1,2,3))

# Matrix mult
A * B    # dot product
A %*% B   # matrix mult


# factors

factor(vector)   # converts vector to factor vector
?factor
levels(factor_vector) <- c('label1', 'label2')   # allows to rename
summary(vector)
factor_speed_vector <- factor(speed_vector, ordered = TRUE, levels = c('slow', 'fast', 'insane'))


# dataframes and EDA
mtcars
head(mtcars)
str(mtcars)

mtcars[1:5,'mpg']

planets_df[planets_df[,'rings']>0, "name"]
subset(planets_df, diameter < 1)   # didn't need the quotes

subset(planets_df, diameter < 1)
planets_df[order(planets_df[,'diameter']),]



# lists

shining_list$actors[2]  # now why does it want the $ signs???

