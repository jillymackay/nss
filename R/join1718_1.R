library(tidyverse)
library(readxl)

NSS18_1 <- read_excel("data_RAW/NSS_taught_all18.xlsx",
                      sheet = "NSS1", skip = 3, col_types = "text") %>%
  rename (StronglyDisagree = "Answered 1",
          Disagree = "Answered 2",
          Neither = "Answered 3",
          Agree = "Answered 4",
          StronglyAgree = "Answered 5",
          Question = "Question Number",
          NotApplic = "N/A",
          SampleSize = "Sample Size",
          Agreement = "Actual value",
          TwoYear = "Two years aggregate data?",
          ConfMin = "Confidence interval - min",
          SubjCode = "Subject Code",
          ConfMax ="Confidence interval - max") %>%
  mutate (StronglyDisagree = parse_double(StronglyDisagree),
          Disagree = parse_double(Disagree),
          Neither = parse_double(Neither),
          Agree = parse_double (Agree),
          StronglyAgree = parse_double (StronglyAgree),
          Agreement = parse_double (Agreement),
          Question = as_factor(Question),
          NotApplic = parse_double(NotApplic),
          Response = parse_double (Response),
          SampleSize = parse_double(SampleSize),
          NotApplic = (NotApplic/SampleSize)) %>%
  gather (key = "Likert", value = "PercRespondents",
          -"UKPRN",
          -"Provider",
          -"Question",
          -ConfMin,
          -ConfMax,
          -"Response",
          -SampleSize,
          -TwoYear,
          -SubjCode,
          -Subject) %>%
  mutate (UKPRN = as_factor(UKPRN),
          Provider = as_factor(Provider),
          TwoYear = as_factor(TwoYear),
          Likert = as_factor(Likert),
          Subject = as_factor(Subject),
          SubjCode = as_factor(SubjCode),
          ConfMin = parse_double(ConfMin),
          ConfMin = case_when(Likert != "Agreement" ~ NA_real_, TRUE ~ ConfMin),
          ConfMax = parse_double(ConfMax),
          ConfMax = case_when(Likert != "Agreement" ~ NA_real_, TRUE ~ ConfMax),
          Year = 2018)




NSS17_1 <- read_excel("data_RAW/NSS_taught_all17.xlsx",
                      sheet = "NSS1", skip = 3, col_types = "text") %>%
  rename (StronglyDisagree = "Answered 1",
          Disagree = "Answered 2",
          Neither = "Answered 3",
          Agree = "Answered 4",
          StronglyAgree = "Answered 5",
          Question = "Question Number",
          NotApplic = "N/A",
          SampleSize = "Sample Size",
          Agreement = "Actual value",
          ConfMin = "Confidence interval - min",
          ConfMax ="Confidence interval - max",
          Provider = Institution) %>%
  mutate (StronglyDisagree = parse_double(StronglyDisagree),
          Disagree = parse_double(Disagree),
          Neither = parse_double(Neither),
          Agree = parse_double (Agree),
          StronglyAgree = parse_double (StronglyAgree),
          Agreement = parse_double (Agreement),
          Question = as_factor(Question),
          NotApplic = parse_double(NotApplic),
          Response = parse_double (Response),
          SampleSize = parse_double(SampleSize),
          NotApplic = (NotApplic/SampleSize)) %>%
  gather (key = "Likert", value = "PercRespondents",
          -"UKPRN",
          -"Provider",
          -"Question",
          -ConfMin,
          -ConfMax,
          -"Response",
          -SampleSize,
          -Subject) %>%
  mutate (UKPRN = as_factor(UKPRN),
          Provider = as_factor(Provider),
          Likert = as_factor(Likert),
          Subject = as_factor(Subject),
          ConfMin = parse_double(ConfMin),
          ConfMin = case_when(Likert != "Agreement" ~ NA_real_, TRUE ~ ConfMin),
          ConfMax = parse_double(ConfMax),
          ConfMax = case_when(Likert != "Agreement" ~ NA_real_, TRUE ~ ConfMax),
          Year = 2017,
          TwoYear = NA)

# now to figure out how to map . . .














# nss_1 <- rbind(NSS17_1,NSS18_1)


# nss_1 <- nss_1 %>%
#  left_join(groupings) %>%
#  left_join(QuestionText)

# rm(groupings, QuestionText)

rm(NSS17_1, NSS18_1)

# devtools::use_data(nss_1, overwrite = TRUE)

