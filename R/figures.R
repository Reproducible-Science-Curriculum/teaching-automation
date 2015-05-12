plot_summary_lifeExp_by_continent <- function(mean_lifeExp) {
    ggplot(mean_lifeExp, aes(x = year, y = mean_lifeExp, colour = continent)) +
      geom_line() + facet_wrap(~ continent) + theme(legend.position = "top")
}

plot_change_trend <- function(mean_lifeExp, year_break) {
    tmp_data <- get_coef_before_after(mean_lifeExp, year_break)
    ggplot(tmp_data, aes(x = period, y = trend, colour = continent, group = continent)) +
      geom_point() + geom_path()
}
