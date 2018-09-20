# Subject Level Mapping



submap1 <- readxl::read_excel("data_raw/data_LP/HECoS-CAH Version 1.1.xlsx",
                             sheet = "HECoS_CAH_Mapping")
submap2 <- readxl::read_excel("data_raw/data_LP/HECoS-CAH Version 1.1.xlsx",
                              sheet = "JACS_CAH_Mapping")

submap <- dplyr::left_join(submap1,
                    submap2)
rm (submap1, submap2)

codes <- readxl::read_excel("data_RAW/NSS_taught_all18.xlsx",
                               sheet = "NSS1", skip = 3, col_types = "text") %>%
  dplyr::mutate (CAH1 = paste("(",`Subject Code`,") ",(tolower(Subject)), sep = ""))

submap2 <- submap %>%
  select(CAH1, HECoS) %>%
  distinct()

codes <- codes %>%
  left_join(submap2)



lc <- codes %>%
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
          -Subject,
          -CAH1,
          -HECoS) %>%
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
