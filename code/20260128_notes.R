# goals: to learn how to plot with ggplot2

#load packages
library(tidyverse)

#load data
sample_data <- read.csv("~/Desktop/ontario-report/data/sample_data.csv")
summerize (sample_data, 
           mean_cells = mean(cells_per_ml))

# no inputs/arguments needed
getwd()
Sys.Date()

# some other functions require input
sum(24,26)

#plot
ggplot(data = sample_data) +
  aes(x = temperature, y= cells_per_ml, 
      color = env_group, size = chlorophyll) +
  labs(x= 'Temperature (C)',
       y= 'Cells per mL',
       title = 'Does temperature affect microbial abundance?',
       color = "Environment Group",
       size = 'Chlorophyll (ug/L)') +
  geom_point()

#Load new Data
buoy_data <- read.csv("~/Desktop/ontario-report/buoy_data.csv")
dim(buoy_data) #rows, columns

ggplot(data = buoy_data) +
  aes(x=day_of_year, y=temperature, 
      color=depth, group = sensor) +
  geom_line() +
  facet_wrap(~buoy) #use ~ to say individual plot for buoy

# GO BACK  to sample data
ggplot(data = sample_data) +
  # x-axis that is discrete: categorical
  aes(x = env_group, y = cells_per_ml,
      #color = env_group, 
      fill = env_group) +
  geom_boxplot(alpha = 0.5) +
  geom_jitter(shape = 23, alpha = 0.5,
              aes(size = chlorophyll))+ #specific criteria should be added on geom bracket, otherwise it will apply globally
  #scale_color_brewer(palette = 'Set1') + 
  scale_fill_brewer(palette = 'Set1')

#layers matter in ggplot, boxplot first and then jitter, can also do jitters first, 
# then set the alpha value for geom boxplot to adjust box transparency


# Univariate plots
ggplot(sample_data) +
  aes(x=cells_per_ml) +
  geom_histogram(bins = 20)
# saving plots
ggsave('histogram_cellperml.png',
       width = 6, height =4, 
       units = 'in')

#practice: ggploy with geom points between chlprophyll and temperature
ggplot(sample_data) +
  aes(x = temperature, y = chlorophyll) +
  geom_smooth() +
  geom_point(aes(color = env_group))+
  labs(x = 'Temprature (C)', 
       y = 'Chlorophyll concentration (ug/L)', 
       title = 'Scatter plot of chlorophyll concentration over temperature')+
  theme_bw() + 
  theme(legend.position = 'right') +
  scale_color_manual (values = c("lightblue", "green", "darkgreen"))















