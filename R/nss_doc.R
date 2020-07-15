#' NSS Summary Data (2020)
#'
#' This object contains the top level NSS 2020 2019 2018 + 2017 results (updated 15/07/2020)
#'
#'
#' @format A data frame containing 421337 rows and 25 columns.
#' \describe{
#'   \item{UKPRN}{(string) - The participant's age}
#'   \item{Provider}{(string) - The name of the providing institution}
#'   \item{Question}{(string) - Short numeric ID of 27 NSS questions plus 6 NHS questions}
#'   \item{ConfMin}{(numeric) - supplied minimum confidence interval for Likert level "Agreement"}
#'   \item{ConfMax}{(numeric) - supplied maximum confidence interval for Likert level "Agreement"}
#'   \item{Response}{(numeric) - Number of respondents to question}
#'   \item{SampleSize}{(numeric) - Number of respondents to survey in institution}
#'   \item{Likert}{(string) - 6 level factor. Likert rating for question, Includes supplied total Agreement, 5-point scale Strongly Disagree to Strongly Agree + Not Applicable}
#'   \item{PercRespondents}{(numeric) - Percentage of response which chose that Likert rating. Derived for 'NA' from n/SampleSize}
#'   \item{TwoYear}{(string) - Where data failed to meet publication thresholds may be aggregated with 2017 data. Not available for 2017}
#'   \item{Year}{(numeric) - What year does data refer to}
#'   \item{Grp_RG}{(string) - Member of Russell Group yes}
#'   \item{Grp_CG}{(string) - Member of Cathedral Group yes}
#'   \item{Grp_GW4}{(string) - Member of the GW4 Group yes}
#'   \item{Grp_MillPlus}{(string) - Member of the MillPlus group yes}
#'   \item{Grp_ABSA}{(string) - Member of the ABSA group yes}
#'   \item{Grp_N8}{(string) - Member of the N8 group yes}
#'   \item{Grp_NCUK}{(string) - Member of NCUK group yes}
#'   \item{Grp_Oxbrg}{(string) - Member of Oxbridge group yes}
#'   \item{Grp_SES}{(string) - Member of Science and Engineering South yes}
#'   \item{Grp_UniAlli}{(string) - Member of the University Alliance yes}
#'   \item{Grp_WhiteRose}{(string) - Member of the white Rose University Consortium yes}
#'   \item{Grp_The1994}{(string) - WAS a member of the 1994 group yes}
#'   \item{QuestGroup}{(string) - Question grouping e.g. Assessment and Feedback, Teaching on my Course, etc.}
#'   \item{QuestText}{(string) - Actual text of question}
#'  }
#'
#'
#' @details Each row corresponds to a percentage of respondents agreed with that Likert Scale
#' @source Office for Students - https://www.officeforstudents.org.uk/advice-and-guidance/student-information-and-data/national-student-survey-nss/
#' @examples
#'
#' # What's the overall satisfaction agreement for the Russell Group?
#'
#'
#' nss %>%
#' dplyr::filter (Grp_RG == "Yes", Question == "Q27", Likert == "Agreement") %>%
#' dplyr::group_by (Provider, Year) %>%
#' dplyr::select (Provider, Year, PercRespondents)
#'
#'


"nss"
