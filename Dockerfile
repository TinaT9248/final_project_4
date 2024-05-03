FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc libcurl4-openssl-dev libxml2-dev libv8-dev libssl-dev 

RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('dplyr')"
RUN Rscript -e "install.packages('cowplot')"

RUN mkdir /project
WORKDIR /project

RUN mkdir final_code
RUN mkdir final_output
COPY final_code final_code
COPY Makefile .
COPY final_project_4.Rmd .
COPY water_potability.csv . 

RUN mkdir final_report

CMD make && mv final_project_4.html final_report