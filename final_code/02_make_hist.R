here::i_am("final_code/02_make_hist.R")

library(ggplot2)
library(dplyr)
library(cowplot)  # For combining plots

# Load the dataset
water_data <- read.csv("water_potability.csv", header = TRUE)
water_data <- na.omit(water_data)
water_data <- water_data %>%
  mutate(Potability_Status = ifelse(Potability == 1, "Potable", "Not Potable"))

# Define the variables of interest
variables_of_interest <- c("ph", "Hardness", "Solids", "Chloramines",
                           "Sulfate", "Conductivity", "Organic_carbon",
                           "Trihalomethanes", "Turbidity")

# Generate plots for each variable
plots <- lapply(variables_of_interest, function(var) {
  binwidth_sep <- if (var %in% c("ph", "Chloramines", "Organic_carbon", "Turbidity")) {
    0.5
  } else if (var == "Solids") {
    2500
  } else {
    10
  }
  
  p <- ggplot(water_data, aes(x = .data[[var]], fill = Potability_Status)) +
    geom_histogram(binwidth = binwidth_sep, color = "black") +
    labs(x = var, y = "Frequency") +
    scale_fill_manual(values = c("Potable" = "pink", "Not Potable" = "steelblue2")) +
    theme_minimal() + theme(legend.position = "none")
  
  p
})

# Combine the plots into one plot
combined_plot <- plot_grid(plotlist = plots, ncol = 3, align = 'v')

# Save the combined plot
ggsave(file = "final_output/histo.png", 
       plot = combined_plot, 
       width = 12, 
       height = 8, 
       units = "in", 
       dpi = 300)

