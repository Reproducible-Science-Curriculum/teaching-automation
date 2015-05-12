### ---- prepare-data ----
split_gdp_files <- list.files(path = "data-raw", pattern = "csv$", full.names = TRUE)
split_gdp_list <- lapply(split_gdp_files, read.csv)
gdp <- do.call("rbind", split_gdp_list)

### ---- mean-lifeExp-per-continent ----
library(dplyr)
mean_lifeExp_by_cont <- gdp %>% group_by(continent, year) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>% as.data.frame


### ---- lifeExp-trends-per-continent ----
library(ggplot2)
ggplot(mean_lifeExp_by_cont, aes(x = year, y = mean_lifeExp, colour = continent)) +
  geom_line() + facet_wrap(~ continent)

### ---- before-after-1985 ----
coef_before_after <- lapply(unique(mean_lifeExp_by_cont$continent), function(cont) {
                                       mdl_before <- lm(mean_lifeExp ~ year,
                                                        data = mean_lifeExp_by_cont,
                                                        subset = (continent == cont & year <= 1979))
                                       mdl_after  <- lm(mean_lifeExp ~ year,
                                                        data = mean_lifeExp_by_cont,
                                                        subset = (continent == cont & year >=  1980))
                                       rbind(c(as.character(cont), "before", coef(mdl_before)[2]),
                                             c(as.character(cont), "after", coef(mdl_after)[2]))
                                   }) %>%
  do.call("rbind", .) %>% as.data.frame %>%
  setNames(c("continent", "period", "trend"))

coef_before_after$trend <- as.numeric(coef_before_after$trend)
coef_before_after$period <- factor(coef_before_after$period, levels = c("before", "after"))

### ---- change-trend ----
ggplot(coef_before_after, aes(x = period, y = trend, colour = continent, group = continent)) +
  geom_point() + geom_path()
