## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
library(dplyr)
library(tidyr)
library(lubridate)
library(frenchdata)
library(ggplot2)

## ----eval=FALSE---------------------------------------------------------------
#  browse_french_site()

## -----------------------------------------------------------------------------
data_sets <- get_french_data_list()

## -----------------------------------------------------------------------------
data_sets

## ----eval=FALSE---------------------------------------------------------------
#  View(data_sets$files_list)

## -----------------------------------------------------------------------------
ff_5_factors <- 
  download_french_data("Fama/French 5 Factors (2x3)")

## -----------------------------------------------------------------------------
ff_5_factors

## -----------------------------------------------------------------------------
ff_5_factors$subsets

## -----------------------------------------------------------------------------
monthly_ff_5_factors <- ff_5_factors$subsets$data[[1]]
monthly_ff_5_factors

## ----fig.width=7--------------------------------------------------------------
monthly_ff_5_factors %>% 
  mutate(date = ym(date)) %>% 
  pivot_longer(cols = -date, 
               names_to = "factor", 
               values_to = "value") %>% 
  ggplot(data = .,
         mapping = aes(x = date, y = value, 
                       group = factor, 
                       color = factor)) +
  geom_line() + 
  labs(caption = "Source: Kenneth French Data Library") +
  facet_wrap( ~ factor)

## ----eval=FALSE---------------------------------------------------------------
#  browse_details_page(ff_5_factors)

## ----eval=FALSE---------------------------------------------------------------
#  ff_5_factors <-
#    download_french_data("Fama/French 5 Factors (2x3)",
#                         dir = ".",
#                         dest_file = "fama_french_5_factors.zip")

## ----eval=FALSE---------------------------------------------------------------
#  ff_5_factors <-
#    download_french_data("Fama/French 5 Factors (2x3)",
#                         dir = ".")

