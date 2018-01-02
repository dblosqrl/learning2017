#ggplot playtime

install.packages('tidyverse')

library(ggplot2)

# bar charts

#standard bar - different colors by bar
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut)
  )

#stacked bar - cut on X-axis, clarity on Y
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity)
  )

# stacked bar - 100%
#standard bar - different colors by bar
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )


# grouped bar - different colors by bar
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )

# position = 'jitter'  # used for point plots to add jitter to overlapping points
# + coord_flip()   # flips x and y axes
# + coord_fixed()    # sets constant x y ratio in axes (i.e. a square)
# + geom_abline(slope = X, intercept = Y)    # adds constant fixed line (how to specify???)
# + geom_vline(yintercept = Y)    # same for hline and xintercept


# outstanding Q
# add data labels
# populate bars by some subtotal - better understand stat_summary

# ggplot(data = <DATA>) +
#  <GEOM_FUNCTION>(
#    mapping = aes(<MAPPINGS>),
#    stat = <STAT>,
#    position = <POSITION>
#  ) +
#  <COORDINATE_FUNCTION> +
#  <FACET_FUNCTION>