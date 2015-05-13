gather_gdp_data <- function() {
    split_gdp_files <- list.files(path = "data-raw", pattern = "gdp-percapita\\.csv$", full.names = TRUE)
    split_gdp_list <- lapply(split_gdp_files, read.csv)
    gdp <- do.call("rbind", split_gdp_list)
    gdp
}

get_mean_lifeExp <- function(gdp) {
    mean_lifeExp_by_cont <- gdp %>% group_by(continent, year) %>%
      summarize(mean_lifeExp = mean(lifeExp)) %>% as.data.frame
    mean_lifeExp_by_cont
}

get_latest_lifeExp <- function(gdp) {
    latest_lifeExp <- gdp %>% filter(year == max(gdp$year)) %>%
      group_by(continent) %>%
      summarize(latest_lifeExp = mean(lifeExp)) %>%
      as.data.frame
    latest_lifeExp
}

get_coef_before_after <- function(mean_lifeExp, year_break) {
    coef_before_after <- lapply(unique(mean_lifeExp$continent), function(cont) {
                                    mdl_before <- lm(mean_lifeExp ~ year,
                                                     data = mean_lifeExp,
                                                     subset = (continent == cont & year <= year_break))
                                    mdl_after  <- lm(mean_lifeExp ~ year,
                                                     data = mean_lifeExp,
                                                     subset = (continent == cont & year > year_break))
                                    rbind(c(as.character(cont), "before", coef(mdl_before)[2]),
                                          c(as.character(cont), "after", coef(mdl_after)[2]))
                                }) %>%
      do.call("rbind", .) %>% as.data.frame %>%
      setNames(c("continent", "period", "trend"))
    coef_before_after$trend <- as.numeric(levels(coef_before_after$trend)[coef_before_after$trend])
    coef_before_after$period <- factor(coef_before_after$period, levels = c("before", "after"))
    coef_before_after
}
