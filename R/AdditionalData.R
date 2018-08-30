# Data We Want to Add to the NSS
library(tidyverse)

# UKPRNS Looked up here: http://learning-provider.data.ac.uk/

# Russell Group Unis https://russellgroup.ac.uk/
RG <- read.csv("data_raw/data_LP/Russell_Group.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_RG = "Yes")
GW4 <- read.csv("data_raw/data_LP/GW4.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_GW4 = "Yes")
ABSA <- read.csv("data_raw/data_LP/ABSA.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_ABSA = "Yes")
CG <- read.csv("data_raw/data_LP/Cathedrals_Group.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_CG = "Yes")
MillPlus <- read.csv("data_raw/data_LP/Million_Plus.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_MillPlus = "Yes")
N8 <- read.csv("data_raw/data_LP/N8_Research_Partnership.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_N8 = "Yes")
NCUK <- read.csv("data_raw/data_LP/NCUK.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_NCUK = "Yes")
Oxbridge <- read.csv("data_raw/data_LP/Oxbridge.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_Oxbrg = "Yes")
SES <- read.csv("data_raw/data_LP/Science_and_Engineering_South.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_SES = "Yes")
UniAlli <- read.csv("data_raw/data_LP/University_Alliance.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_UniAlli = "Yes")
WhiteRose <- read.csv("data_raw/data_LP/White_Rose_University_Consortium.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_WhiteRose = "Yes")
The1994 <- read.csv("data_raw/data_LP/1994_Group.csv", header = TRUE) %>%
  select (UKPRN) %>%
  mutate (Grp_The1994 = "Yes")



groupings <- RG %>%
  left_join(CG) %>%
  left_join(GW4) %>%
  left_join(MillPlus) %>%
  left_join(ABSA) %>%
  left_join(N8) %>%
  left_join(NCUK) %>%
  left_join(Oxbridge) %>%
  left_join(SES) %>%
  left_join(UniAlli) %>%
  left_join(WhiteRose) %>%
  left_join(The1994) %>%
  mutate (UKPRN = parse_character(UKPRN),
          UKPRN = as_factor(UKPRN))

rm(RG, CG, GW4, MillPlus, ABSA, N8, NCUK, Oxbridge, SES, UniAlli, WhiteRose, The1994)


QuestionText <- tibble  (Question = c("Q01", "Q02", "Q03", "Q04", "Q05", "Q06", "Q07", "Q08", "Q09", "Q10",
                                      "Q11", "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18", "Q19", "Q20",
                                      "Q21", "Q22", "Q23", "Q24", "Q25", "Q26", "Q27", "NHS1", "NHS2", "NHS3",
                                      "NHS4", "NHS5", "NHS6"),
                         QuestGroup = c("Teaching on my Course",
                                        "Teaching on my Course",
                                        "Teaching on my Course",
                                        "Teaching on my Course",
                                        "Learning Opportunities",
                                        "Learning Opportunities",
                                        "Learning Opportunities",
                                        "Assessment and Feedback",
                                        "Assessment and Feedback",
                                        "Assessment and Feedback",
                                        "Assessment and Feedback",
                                        "Academic Support",
                                        "Academic Support",
                                        "Academic Support",
                                        "Organisation and Management",
                                        "Organisation and Management",
                                        "Organisation and Management",
                                        "Learning Resources",
                                        "Learning Resources",
                                        "Learning Resources",
                                        "Learning Community",
                                        "Learning Community",
                                        "Student Voice",
                                        "Student Voice",
                                        "Student Voice",
                                        "Student Union",
                                        "Overall Satisfaction",
                                        "NHS",
                                        "NHS",
                                        "NHS",
                                        "NHS",
                                        "NHS",
                                        "NHS"),
                         QuestText = c("Staff are good at explaining things",
                                       "Staff have made the subject interesting",
                                       "The course is intellectually stimulating",
                                       "My course has challenged me to achieve my best work",
                                       "My course has provided me with opportunities to explore ideas or concepts in depth",
                                       "My course has provided me with opportunities to bring information and ideas together from different topics",
                                       "My course has provided me with opportunities to apply what I have learnt",
                                       "The criteria used in marking have been clear in advance",
                                       "Marking and assessment has been fair",
                                       "Feedback on my work has been timely",
                                       "I have received helpful comments on my work",
                                       "I have been able to contact staff when I needed to",
                                       "I have received sufficient advice and guidance in relation to my course",
                                       "Good advice was available when I needed to make study choices on my course",
                                       "The course is well organised and running smoothly",
                                       "The timetable works efficiently for me",
                                       "Any changes in the course or teaching have been communicated effectively",
                                       "The IT resources and facilities provided have supported my learning well",
                                       "The library resources (e.g. books, online services and learning spaces) have supported my learning well",
                                       "I have been able to access course-specific resources (e.g. equipment, facilities, software, collections) when I needed to",
                                       "I feel part of a community of staff and students",
                                       "I have had the right opportunities to work with other students as part of my course",
                                       "I have had the right opportunities to provide feedback on my course",
                                       "Staff value students’ views and opinions about the course",
                                       "It is clear how students’ feedback on the course has been acted on",
                                       "The students’ union (association or guild) effectively represents students’ academic interests",
                                       "Overall, I am satisfied with the quality of the course",
                                       "I received sufficient preparatory information prior to my placement(s).",
                                       "I was allocated placement(s) suitable for my course.",
                                       "I received appropriate supervision on placement(s).",
                                       "I was given opportunities to meet my required practice learning outcomes / competences.",
                                       "My contribution during placement(s) as part of the clinical team was valued.",
                                       "My practice supervisor(s) understood how my placement(s) related to the broader requirements of my course."))


# JACS to HECOS Mapping
submap <- readxl::read_excel("data_raw/data_LP/JACS3-to-HECoS-mapping_2017-06-28.xlsx",
                             sheet = "Sheet1")



