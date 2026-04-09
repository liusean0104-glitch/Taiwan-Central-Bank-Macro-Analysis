library(ggplot2)
library(tidyr)

df <- data.frame(
  Year = 1988:2024,
  Foreign_Assets = c(2233670, 2068915, 2116554, 2274610, 2244136, 2381601, 2579694, 2617124, 2573175, 2875757, 
                     3063053, 3490868, 3674295, 4430897, 5775104, 7178305, 7832744, 8476318, 8842916, 8933980, 
                     9713834, 11357059, 11422580, 11838777, 11900655, 12658241, 13393681, 14165207, 14137030, 
                     13629397, 14349642, 14497203, 15260031, 15338720, 17209119, 17708238, 19051664),
  NCDs = c(114600, 37900, 24700, 165800, 321700, 486250, 557450, 467500, 335000, 157600, 
           425500, 812650, 1025800, 1412450, 2258950, 3124600, 3456700, 3589200, 3612450, 3363650, 
           4217350, 6056550, 6380550, 6560950, 6750200, 6913500, 7163800, 7422100, 7532400, 7510950, 
           7624350, 7715600, 8245300, 9324550, 8563200, 8124500, 8258900)
)

df_long <- pivot_longer(df, cols = c("Foreign_Assets", "NCDs"), names_to = "Variable", values_to = "Amount")


ggplot(df_long, aes(x = Year, y = Amount, color = Variable, group = Variable)) +
  geom_line(linewidth = 1.5) +
  geom_point(size = 1.5) +
  scale_y_continuous(labels = scales::comma) + 
  scale_x_continuous(breaks = seq(1990, 2024, 10)) +
  labs(
    title = "Taiwan's Central Bank Foreign Assets & NCDs (1988-2024)",
    subtitle = NULL,
    x = NULL,
    y = NULL,
    caption = NULL,
    color = "Indicator Type"
  ) +
  
  scale_color_manual(
    values = c("Foreign_Assets" = "#FF0000", "NCDs" = "#228B22"),
    labels = c("Foreign Assets", "NCDs Outstanding")
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    
    text = element_text(family = "Times New Roman"),
    plot.title = element_text(face = "bold", size = 14),
    legend.text = element_text(size = 14),
    legend.title = element_text(face = "bold", size = 14),
    panel.grid.minor = element_blank()
  )