library(tidyverse)
library(lubridate)
library(janitor)
library(lpSolve)
knitr::opts_chunk$set(echo = TRUE)
options(scipen=999)
set.seed(10982)

students <- read_csv("students.csv") %>%
  separate(Name, c("last", "first")) %>%
  mutate(name = paste(last, "-", first, sep = ""),
         name = tolower(name)) %>%
  select(name)

for(i in 1:dim(students)[1]){
  rmarkdown::render(input = "src/optim-problem.Rmd",
                    output_format = "pdf_document",
                    output_file = paste(students[i, 1], "-project-2-report.pdf", sep=""),
                    output_dir = "src/reports")
}
