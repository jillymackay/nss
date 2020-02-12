[![Travis build status](https://travis-ci.org/jillymackay/nss.svg?branch=master)](https://travis-ci.org/jillymackay/nss)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/jillymackay/nss?branch=master&svg=true)](https://ci.appveyor.com/project/jillymackay/nss)


# nss
- [nss](#nss)
    + [What is `nss` for?](#what-is-nss-for)
    + [Install](#install)
    + [License](#license)



## What is nss for?
This package aims to provide [National Student Survey](https://www.officeforstudents.org.uk/advice-and-guidance/student-information-and-data/national-student-survey-nss/) data in a tidy, documented format. 

At present the package provides top-level data from 2017, 2018 and 2019 iterations of survey.


### Subject Level Data
As of 2018, the previously used Joint Academic Coding System ( [JACS](https://www.hesa.ac.uk/support/documentation/jacs)) classification of subjects will be replaced by the Higher Education Classification of subjects ( [HECoS](https://www.hesa.ac.uk/innovation/hecos)) codes. In 2018 a third system, the Common Aggregation Hierarchy (or [CAH](https://www.hesa.ac.uk/innovation/hecos)) is being used to bridge the gap between JACS and HECoS. 

**At present I am working on a memory-cheap and future-proof way of joining JACS, CAH and HECoS codes together. Subject level data will follow**


### Pre 2017 Data

The survey changed from 2016-2017 and HEFCE, who owned the data prior to Office for Students, were very concerned that people may compile 2017 and pre-2017 data as there was a significant survey change at that point. 

In the future I would like to combine this with older datasets. 


### A word on naming
Through the gentle guidance of my good colleague [Ian Handel](https://github.com/ianhandel) I conceded to naming this package as the lowercase `nss`, and the top level object shares that name. However column headings have capitals because that's easier to read and this is a hill I am prepared to die on. 



## Install
At present, no plans to push this through CRAN so use GitHub.


``` r
devtools::install_github("jillymackay/nss")
```





License
-------

The National Student Survey data is coordinated by the Office for Students. It is currently (as of 2018) delivered by Ipsos MORI and results made available by Texuna Technologies.
https://www.officeforstudents.org.uk/advice-and-guidance/student-information-and-data/national-student-survey-nss/contacts-and-privacy/

All the data used here is publicly available. 

All this code is CC0

