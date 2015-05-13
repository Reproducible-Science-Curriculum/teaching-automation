context("gdp data")
test_that("gather_gdp_data() includes all files", {
          expect_equal(length(list.files(path = "data-raw", pattern = "gdp-percapita\\.csv$")),
                       length(unique(gather_gdp_data()$country)))
      })

context("mean life exp")
test_that("mean life expectancy has correct dimensions", {
              owd <- setwd("..")
              gdp <- gather_gdp_data()
              setwd(owd)
              expect_equal(nrow(get_mean_lifeExp(gdp)),
                           5 * length(unique(gdp$year))+1)
          })

context("get coef before after")
test_that("africa has lower than other countries", {
              owd <- setwd("..")
              gdp <- gather_gdp_data()
              setwd(owd)
              gdp_coef <- get_coef_before_after(get_mean_lifeExp(gdp), 1980)
              expect_equal(names(which.min(with(gdp_coef, tapply(trend, continent, function(x) x[2] - x[1])))),
                           "Africa")
          })
