# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(stringr)
library(tidyverse)
library(rebus)

# Data Import
citations <- stri_read_lines(con = "../data/citations.txt", encoding = "iso-8859-1") 
citations_txt <- str_subset(citations, pattern = ANY_CHAR)
length(citations) - length(citations_txt)

#list of encodings stri_enc_list(simplify = TRUE) ISO-8859-1 taken from class notes
