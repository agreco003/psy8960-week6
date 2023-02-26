# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(stringr)
library(tidyverse)
#library(rebus)

# Data Import
citations <- stri_read_lines(con = "../data/citations.txt", encoding = "iso-8859-1")
citations_txt <- str_subset(citations, pattern = regex("."))
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, 10)

citations_tbl <- enframe(citations_txt, name = "line", value = "cite") %>%
  mutate(cite = str_replace_all(cite, pattern = regex("\"|\'"), replacement = "")) %>%
  mutate(year = str_match(cite, pattern = regex("\\((\\d\\d\\d\\d)\\)"))[,2]) %>%
  mutate(page_start = str_match(cite, pattern = regex("(\\d*)-\\d*\\.*\\s?\\.?$"))[,2]) %>%
  mutate(perf_ref = str_detect(cite, pattern = regex("performance", ignore_case = TRUE))) %>%
  mutate(title = str_match(cite, pattern = regex("\\(\\d\\d\\d\\d\\)\\.\\s([^\\.\\?]+)\\."))[,2]) %>%
  mutate(first_author = str_match(cite, pattern = regex("([A-Za-z ]+[,]?[\\s]?[A-Z]?[\\.]?[\\s]?[A-Z][.])[,]?[\\s]?"))[,2])

sum(!is.na(citations_tbl$first_author))
  

# list of encodings stri_enc_list(simplify = TRUE) ISO-8859-1 taken from class notes
# to test line 10
#sum(stri_isempty(citations)) = 10834
#library(htmltools)
#library(htmlwidgets)
#str_view(citations, pattern = regex("."))
#line16 left intentionally blank not needed
#str_match()[,2] works because the result is a dataframe that you can select a column from. Makes for lots of control
#Spot checks for final row (next 3 lines):
#trying to catch more authors not APA format =  mutate(first_author = str_match(cite, pattern = regex("([A-Z][a-z,]+[\\s]?[A-Z]?[\\.]?[,]?[\\s]?[A-Z]?[.]?[,]?)[\\s]?"))[,2])
print((citations_tbl$first_author))
print(!is.na(citations_tbl$first_author))
