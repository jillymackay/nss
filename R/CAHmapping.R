#Mapping test
library(tidyverse)


#submap1 <- readxl::read_excel("data_raw/data_LP/HECoS-CAH Version 1.1.xlsx",
#                             sheet = "HECoS_CAH_Mapping")
#submap2 <- readxl::read_excel("data_raw/data_LP/HECoS-CAH Version 1.1.xlsx",
#                              sheet = "JACS_CAH_Mapping")

#submap <- left_join(submap1,
#                    submap2)
#rm (submap1, submap2)

#codes <- readxl::read_excel("data_RAW/NSS_taught_all18.xlsx",
 #                              sheet = "NSS1", skip = 3, col_types = "text") %>%
#  mutate (CAH1 = paste("(",`Subject Code`,") ",(tolower(Subject)), sep = ""))

#submap2 <- submap %>%
#  select(CAH1, HECoS) %>%
#  distinct()

#codes <- codes %>%
 # top_n(100000) %>%
  # left_join(submap2)
