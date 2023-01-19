library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(ggpubr)

cwd <- dirname(rstudioapi::getSourceEditorContext()$path)

#load data

#unique(st$mileage)

st <- read.csv(
  paste(cwd,"/ShowcaseDataWinter2023.csv",sep=""),
  stringsAsFactors = FALSE
)

min(st$price)
max(st$price)

price_map <- c(
  "$0 to $15k" = 0,
  "$15k to $20k" = 1,
  "$20k to $25k" = 2,
  "$25k to $30k" = 3,
  "$30k to $35k" = 4,
  "$35k to $40k" = 5,
  "$40k to $45k" = 6,
  "$45k to $50k" = 7,
  "$50k to $55k" = 8,
  "$55k to $60k" = 9,
  "$60k to $65k" = 10,
  "$65k to $70k" = 11,
  "$70k+" = 12
)

mileage_map <- c(
  "0 to 5k miles" = 0,
  "5k to 10k miles" = 1,
  "10k to 15k miles" = 2,
  "15k to 20k miles" = 3,
  "20k to 25k miles" = 4,
  "25k to 30k miles" = 5,
  "30k to 35k miles" = 6,
  "35k to 40k miles" = 7,
  "40k to 45k miles" = 8,
  "45k to 50k miles" = 9,
  "50k to 55k miles" = 10,
  "55k to 60k miles" = 11,
  "60k to 65k miles" = 12,
  "65k to 70k miles" = 13,
  "70k to 75k miles" = 14,
  "75k to 80k miles" = 15,
  "80k to 85k miles" = 16,
  "85k to 90k miles" = 17,
  "90k to 95k miles" = 18,
  "95k to 100k miles" = 19,
  "100k+ miles" = 20
)

offer_map<-c("$0k to $5k" = 0, "$5k to $10k" = 1, "$10k to $15k" = 2, "$15k to $20k" = 3, "$20k to $25k" = 4, "$25k to $30k" = 5, "$30k to $35k" = 6, "$35k to $40k" = 7, "$40k+" = 8)

st_1 <- st %>%
  mutate(
    price_level = price_map[price],
    mileage_level = mileage_map[mileage],
    appraisal_offer_level= as.factor(offer_map[ appraisal_offer])
  )

price_level_ecdf = ggplot(
  aes(x = price_level
  ),
  data = st_1
) +
  stat_ecdf() +
  ylab("ECDF") +
  xlab("price")
price_level_ecdf

