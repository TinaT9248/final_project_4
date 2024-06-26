# Report associated 
report.html: final_project_4.Rmd final_code/03_render_report.R tables figure
	Rscript final_code/03_render_report.R

tables: final_code/01_make_table.R water_potability.csv
	Rscript final_code/01_make_table.R
	
figure: final_code/02_make_hist.R water_potability.csv
	Rscript final_code/02_make_hist.R

.PHONY: clean
clean:
	rm -f final_output/*.rds && rm -f final_output/*.png && rm -f report.html
	
install:
	Rscript -e "renv::restore()"
	
# Docker associated 
PROJECTFILES = final_project_4.Rmd final_code/01_make_table.R final_code/02_make_hist.R final_code/03_render_report.R Makefile 
RENVFILES = renv.lock renv/activate.R renv/settings.json
# rule to build image 
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final_project_image .
	touch $@
# rule to build final report in the container
final_report/report.html: project_image
	docker run -v $$(pwd)/final_report:/project/final_report final_project_image
