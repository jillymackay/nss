# nss
- [nss](#nss)
    + [What is `nss` for?](#what-is-nss-for)
    + [Install](#install)
    + [Notes, Warnings and Fears](#notes-warnings-and-fears)
    + [License](#license)



## What is nss for?
This package aims to provide National Student Survey data in a tidy, documented format. 

So far we've only got the top-level results for 2017 and 2018.

The survey changed from 2016-2017 and HEFCE, who owned the data prior to Office for Students, were very concerned that people may compile 2017 and pre-2017 data as there was a significant survey change at that point. 

That is an issue to sort.

**Presently working on a memory-cheap and future-proof way of joining JACS, CAH and HECoS codes together**

### A word on naming
Through the gentle guidance of my good colleague ["@ianhandel"](https://github.com/ianhandel) I conceded to naming this package as the lowercase `nss`, and the top level object shares that name. However column headings have capitals because that's easier to read and this is a hill I am prepared to die on. 



## Install
At present, use only github


``` r
devtools::install_github("jillymackay/nss")
```

## Notes Warnings and Fears
### First - there is no data here
Waiting on permission from Office for Students to collapse their ever expanding list of spreadsheets into a nice tidy .rdata file. Until then my data folders look like this:


### data_raw/

+ NSS_taught_all12.xlsx (NB - renamed file from HEFCE download)

+ NSS_taught_all12.xlsx

+ NSS_taught_all_14-new.xlsx

+ NSS_taught_all15.xlsx

+ NSS_taught_all16.xlsx

+ NSS_taught_all17.xlsx

+ NSS_taught_all18.xlsx

+ NSSFullTime1_candidate11.xls (NB-renamed file from HEFCE download)

+ NSSFullTime2_candidate11.xls (NB-renamed file from HEFCE download)

+ NSSFullTime08.xls (NB-renamed file from HEFCE download)

+ NSSFullTime109.xls (NB-renamed file from HEFCE download)

+ NSSFullTime110.xls (NB-renamed file from HEFCE download)

+ NSSFullTime209.xls (NB-renamed file from HEFCE download)

+ NSSFullTime210.xls (NB-renamed file from HEFCE download)

### data_raw/data_LP
**NB: See R/AdditionalData.R**
+ 1994_Group.csv

+ ABSA.csv

+ Cathedrals_Group.csv

+ GW4.csv

+ Million_Plus.csv

+ N8_Research_Partnership.csv

+ NCUK.csv

+ Oxbridge.csv

+ Russell_Group.csv

+ Science_and_Engineering_South.csv

+ University_Alliance.csv

+ White_Rose_University_Consortium.csv

+ HECoS-CAH Version 1.1.xlsx  (From: [https://www.hesa.ac.uk/innovation/hecos](https://www.hesa.ac.uk/innovation/hecos))


License
-------

The National Student Survey data is coordinated by the Office for Students. It is currently (as of 2018) delivered by Ipsos MORI and results made available by Texuna Technologies.
https://www.officeforstudents.org.uk/advice-and-guidance/student-information-and-data/national-student-survey-nss/contacts-and-privacy/

All the data used here is publicly available. 

All this code is CC0

