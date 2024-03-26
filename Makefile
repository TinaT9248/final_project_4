report.html: final_project_4.Rmd final_code/03_render_report.R tables figure
	Rscript final_code/03_render_report.R

tables: final_code/01_make_table.R water_potability.csv
	Rscript final_code/01_make_table.R
	
figure: final_code/02_make_hist.R water_potability.csv
	Rscript final_code/02_make_hist.R

.PHONY: clean
clean:
	rm -f final_output/*.rds && rm -f final_output/*.png && rm -f report.html