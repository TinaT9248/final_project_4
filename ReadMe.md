## Code description

`final_code/01_make_table.R`

  - read the `water_potability.csv` 
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

## How to produce report 
`final_project_4.Rmd` is used to read both tables and the figure from the `final_output/` folder. Runs `final_code/03_render_report.R` to render `final_project_4.Rmd`. 

## How to synchronize package repository
When running `make install`, it executes an R script from the command line that calls `renv::restore()`, which reads the `renv.lock` file and installs all necessary packages as specified.

## Building the Docker Image
Here is the link to my image on DockerHub: https://hub.docker.com/r/tteng55169248/final_project_image
To build the Docker image for the final project, ensure you have Docker installed and running on your machine. 
Then, when run `make project_image`, it will use the Dockerfile in the project directory to build the image and tag it as `final_project_image`.

## Generate the final report
To run the automated version of the image and generate the final report, you can use `make final_report/report.html`. This command mounts the `final_report` directory from your local system to the Docker container and runs the Docker image to generate the report inside the `final_report` directory.
