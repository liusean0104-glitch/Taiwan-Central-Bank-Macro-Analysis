
library(ggplot2)
library(scales)

data <- data.frame(
  year = 1998:2024,
  assets = c(3654062, 4140407, 4133382, 5014980, 6577933, 8145026, 8517042, 
             9094433, 9449985, 9672904, 10355000, 12662063, 13482097, 13375091, 
             13372592, 14311607, 15196420, 16136497, 16125453, 15762242, 16480226, 
             16159557, 18018212, 18849359, 19442884, 19537262, 20906496),
  
  gdp = c(9366337, 9804503, 10328549, 10119429, 10630911, 10924029, 11596241, 
          12036675, 12572587, 13363917, 13115096, 12919445, 14060345, 14262201, 
          14677765, 15270728, 16258047, 17055080, 17555268, 18012387, 18420039, 
          18974097, 20023752, 21773291, 22820430, 23598348, 25737088)
)

data$ratio <- data$assets / data$gdp

ggplot(data, aes(x = year, y = ratio)) +
  
  geom_line(color = "red", linewidth = 2) +
  geom_point(color = "#e74c3c", size = 2) +
  scale_y_continuous(labels = percent_format(accuracy = 1)) +
  scale_x_continuous(breaks = seq(1998, 2024, 2)) +
  labs(
  
    title = "1998-2024 Trend of the Ratio of Taiwan's Central Bank Assets to Nominal GDP",
    subtitle = NULL,
    x = NULL,
    y = NULL,
    caption = NULL
  ) +
  theme_minimal() + 
  theme(
    
    plot.title = element_text(family = "Times New Roman", face = "bold", size = 11),
    panel.grid.minor = element_blank()
  )