context("gdp data")
test_that("gather_gdp_data() includes all files", {
              expect_true(nrow(gather_gdp_data(path = "../data-raw")) > 100 )
              expect_equal(length(list.files(path = "../data-raw", pattern = "gdp-percapita\\.csv$")),
                           length(unique(gather_gdp_data(path = "../data-raw")$country)))
          })

context("mean life exp")
test_that("mean life expectancy has correct dimensions", {
              gdp <- gather_gdp_data(path = "../data-raw")
              expect_equal(nrow(get_mean_lifeExp(gdp)),
                           5 * length(unique(gdp$year)))
          })

context("get coef before after")
test_that("africa has lower than other countries", {
              gdp <- gather_gdp_data(path = "../data-raw")
              gdp_coef <- get_coef_before_after(get_mean_lifeExp(gdp), 1980)
              expect_equal(names(which.min(with(gdp_coef, tapply(trend, continent, function(x) x[2] - x[1])))),
                           "Africa")
          })
