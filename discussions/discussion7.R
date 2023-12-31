library(tidyverse)
data("mtcars")

# Basic plot with no label edits
p1 <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
p1

# Adding title and labels
plot_labels <- labs(x="Car Weight (thousands lbs)",
                    y="Miles per Gallon",
                    title="MTCars: Fuel Efficiency vs Car Weight",
                    subtitle="Consumers should be aware of the tradeoff between a car's weight and fuel efficiency")
p2 <- p1 + plot_labels
p2

# Flagging Japanese branded cars for later plotting
getFirst <- function(l){l[[1]]}
mtcars$make <- lapply(str_split(rownames(mtcars), " "), getFirst)
mtcars$is_japanese <- ifelse((mtcars$make == "Mazda") | (mtcars$make == "Honda") | (mtcars$make == "Toyota"),
                             TRUE, FALSE)

# Plot highlighting Japanese cars - colored in blue
p4 <- ggplot(mtcars, aes(x=wt, y=mpg, color=is_japanese)) + geom_point() + 
  labs(x="Car Weight (thousands lbs)",
       y="Miles per Gallon",
       title="MTCars: Fuel Efficiency vs Car Weight",
       subtitle="Consumers should be aware of the tradeoff between a car's weight and fuel efficiency. Japanese manufacturers tend towards the more fuel efficient end of the spectrum",
       color="Japanese Manufacturer?")
p4




