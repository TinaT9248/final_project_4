here::i_am(
  "final_code/02_make_hist.R"
)

water_data <- 
  read.csv("water_potability.csv", header = TRUE)

water_data <- na.omit(water_data)

library(ggplot2)
library(dplyr)
library(ggpubr)  # Load ggpubr for ggarrange

# Assuming 'water_data' is your dataframe containing all the variables
variables_of_interest <- c("ph", "Hardness", "Solids", "Chloramines", 
                           "Sulfate", "Conductivity", "Organic_carbon", 
                           "Trihalomethanes", "Turbidity")
variables_name <- c("pH value", "Hardness", "Total dissolved solids", "Chloramines level", 
                    "Sulfate level", "Conductivity", "Total Organic Carbon", 
                    "Trihalomethanes", "Turbidity of water")

# Create an empty list to store the plots
plots <- vector("list", length(variables_of_interest))

water_data <- water_data %>%
  mutate(Potability_Status = ifelse(Potability == 1, "Potable", "Not Potable"))

# Create histograms for each variable
for (i in seq_along(variables_of_interest)) {
  variable <- variables_of_interest[i]
  binwidth_sep <- ifelse(variable %in% c("ph", "Chloramines", "Organic_carbon", "Turbidity"), 0.5,
                         ifelse(variable == "Solids", 2500, 10))
  
  p <- ggplot(water_data, aes(x = !!sym(variable), fill = Potability_Status)) +
    geom_histogram(binwidth = binwidth_sep) +  # Adjust binwidth as needed
    labs(x = variables_name[i],
         y = "Frequency") +
    scale_fill_manual(values = c("Potable" = "pink", "Not Potable" = "steelblue2")) +  # Set fill colors
    theme(legend.position = "none")  # Hide automatic legend
  
  # Store the plot in the list
  plots[[i]] <- p
}

# Combine all plots using ggarrange
combined_plots <- ggarrange(plotlist = plots, ncol = 3, nrow = 3, common.legend = TRUE)

ggsave(
  file = "final_output/histo.png",
  plot = combined_plots,
  device = "png"
)
