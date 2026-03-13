################################################################################
################ Bi1121c: Visualization in R ###################################
################################################################################

# Import the libraries
library(ggplot2)
library(palmerpenguins)
library(plotly)
library(dplyr)
library(tidyr)

# Read the palmerpenguins data into 'data' variable
data <- penguins

################################################################################
###################### Exploring the dataset ###################################
################################################################################

# Get the structure of data, number of rows and number of columns

# How many NA values are in total in the dataset?

# Remove rows containing NA values. How many rows are left now?

# What islands do these penguins live on?

# What is the mean body mass of male penguins?

# Compute maximum flipper length for each of the penguin species

# Compute how many penguins lived on each of the islands in each year

# (HW) Is the minimal bill length of Adelie species higher than Gentoo?

# (HW) On which island do more female than male penguins live?


################################################################################
############################## Visualization ###################################
################################################################################

################################ Base R ########################################

# Adjust the following code, so that it has proper labels of x-axis, y-axis and title
boxplot(data$body_mass_g ~ data$species)

# Adjust the following code, so that:
# Color of the points is based on species, and add the color legend
# Size of the points is 1
# Shape of the points is based on sex
plot(x =  data$bill_depth_mm, 
     y =  data$bill_length_mm)

# Adjust the following code, so that the barplot is horizontal (years will be on y axis)
data.barplot <- data %>%
  group_by(year) %>%
  summarise(n = n()) 

barplot(data.barplot$n,
        xlab = 'Year',
        ylab = 'Number of penguins',
        names.arg= data.barplot$year)

# Create a barplot, where you plot the number of male and female penguins in the study

# Plot the histogram of flipper length of penguins living on Biscoe island in year 2008.

# Create a box plot of bill length [y] based on sex [x], and reorder the x-axis labels in a way male is first

# Create a scatterplot of flipper length based on body mass
# color the points based on the island
# set the shape of points based on the species
# label the axes appropriately

################################# ggplot2 ######################################

# Adjust the following code, so that the bar plot is horizontal
data %>%
  group_by(island) %>%
  summarise(n = n()) %>%
  ggplot(aes(x = island, y = n))+
  geom_bar(stat = "identity") 

# Adjust the following code, so that the boxplot fill is based on species
data %>%
  ggplot(aes(x = sex, y = bill_length_mm))+
  geom_boxplot()

# Adjust the previous code, so that faceting on island will be on x-axis
data %>%
  ggplot(aes(x = sex, y = bill_length_mm, fill = species))+
  geom_boxplot() 

# Adjust the following code: add individual points using the geom_jitter() on the plot
# Color the individual points based on species
data %>%
  ggplot(aes(x = sex, y = bill_length_mm))+
  geom_boxplot()

# Plot the histogram of body mass of penguins living on Biscoe island in 2008

# Create a scatterplot, where you will plot the dependency of bill length on bill depth and:
#   - color the points by species,
#   - set the shape based on island,
#   - create facets based on sex,
#   - set the theme to theme_minimal()
#   - label the axes appropriately

# Create a stacked barplot, where:
#   - on the x-axis will be species
#   - on y axis counts for each of the respective categories (number of penguins),
#   - fill will be based on island,
#   - set theme to theme_classic()

# Plot a violin plot of Adelie species body mass based on island and overlay it with a boxplot.
#   - Change the color based on island. 
#   - How does parameter trim = FALSE in the geom_violin() function change the output? 

# Create a scatterplot, where you will display the flipper length and body mass of Adelie species which have bill length >= 36,
#   - color the points based on the island, and use a dark palette from RColorBrewer package. 
#   - Use theme_minimal()
#   - change the points size to 2
#   - change opacity to 0.5 

# Adjust the previous graph as if you were to publish it in a scientific journal :-)

################################################################################

# Read into 'df' variable the 'stats-results.csv' file

# plot a volcano plot for the Ubi6-Ctrl contrast
# add a variable 'significant' specifying if the protein is upregulated, downregulated or not-changed
## upregulated: logFC > 1 & p-value < 0.05
## downregulated: logFC < -1 & p-value < 0.05
## not-changed: all other cases

# color the points based on the 'significant' variable
# let's suppose we are specifically interested in following proteins: ARF4, BRAP.1, PSMD12, USP5, TNIP1, VKORC1
## label these proteins in the volcano plot

# create the volcano plot in interactive version using plotly or ggplotly
# use the 'df'; color the points based on 'significant' variable
# display gene names on hover 
# save the interactive volcano plot as an .html file