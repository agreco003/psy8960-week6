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
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, 10)

citations_tbl <- as_tibble(citations_txt, rownames = "line", coumn_name = "cite")

# list of encodings stri_enc_list(simplify = TRUE) ISO-8859-1 taken from class notes
# to test line 10
#library(htmltools)
#library(htmlwidgets)
#str_view(citations, pattern = ANY_CHAR, match = FALSE)