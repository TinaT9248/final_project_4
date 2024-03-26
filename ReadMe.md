## Code description

`final_code/01_make_table.R`

  - read the `water_postability.csv` 
  - Calculate summary statistics for continuous variables and round to 4 digits as the first `.rds` object in `final_output/` folder
  - Separate the continuous variables by the binomial variable `Postability` and produce summary statistics as the second `.rds` object in `final_output/` folder

`final_code/02_make_hist.R`

  - read the `water_postability.csv`
  - Create histograms for each variable and save as the `.png` object in `final_output/` folder 
  
`final_code/03_render_report.R`

  - renders `final_project_4.Rmd`

`final_project_4.Rmd`

  - reads both `.rds` tables created by `final_code/01_make_table.R`
  - read the histogram created by `final_code/02_make_hist.R`
  - produce the `.html` report 