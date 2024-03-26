here::i_am(
  "final_code/01_make_table.R"
)

water_data <- 
  read.csv("water_potability.csv", header = TRUE)

water_data <- na.omit(water_data)

water_data_subset <- water_data[, 1:9]

library(gtsummary)

table1 <- water_data_subset %>%
  tbl_summary(
    type = list(all_continuous() ~ "continuous2"),
    statistic = list(all_continuous() ~ c("{mean}", "{sd}", "{min}", "{max}"))
  )

table2 <- water_data %>%
  tbl_summary(
    by = Potability,  # Updated variable name
    type = list(Potability ~ "categorical"),
    missing = "no"
  ) %>%
  add_n()


saveRDS(
  table1, 
  file ="final_output/table1.rds"
  )

saveRDS(
  table2, 
  file ="final_output/table2.rds"
)
