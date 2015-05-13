## load all the functions in memory
invisible(sapply(list.files(path = "R", pattern = "R$", full.names = TRUE), source))

### Data -----------------------------------------

make_data <- function(path = manuscript_options()$data_output, verbose = TRUE) {
    make_gdp_data()
    make_mean_lifeExp_data()
}

make_gdp_data <- function(path = manuscript_options()$data_output) {
    gdp <- gather_gdp_data()
    make_csv(gdp, file = file.path(path, "gdp.csv"))
}

make_mean_lifeExp_data <- function(path = manuscript_options()$data_output) {
    gdp <- gather_gdp_data()
    make_csv(get_mean_lifeExp(gdp), file = file.path(path, "mean_lifeExp.csv"))
}

clean_data <- function(path = manuscript_options()$data_output) {
    to_rm <- list.files(path = path, pattern = "csv$", full.names = TRUE)
    res <- file.remove(to_rm)
    invisible(res)
}

### Figures --------------------------------------

make_figures <- function(path = manuscript_options()$figures, ...) {
    make_summary_by_continent(path = path, ...)
    make_change_trend(path = path, ...)
}

make_summary_by_continent <- function(path = manuscript_options()$figures, ...) {
    mean_lifeExp <- get_mean_lifeExp(gather_gdp_data())
    p <- plot_summary_lifeExp_by_continent(mean_lifeExp)
    make_pdf(print(p), file = file.path(path, "summary_by_continent.pdf"), ...)
}

make_change_trend <- function(path = manuscript_options()$figures,
                              year = manuscript_options()$year,
                              ...) {
    mean_lifeExp <- get_mean_lifeExp(gather_gdp_data())
    p <- plot_change_trend(mean_lifeExp, year = year)
    make_pdf(print(p), file = file.path(path, "change_trend.pdf"), ...)
}

clean_figures <- function(path = manuscript_options()$figures) {
    to_rm <- list.files(path = path, pattern = "pdf$", full.names = TRUE)
    res <- file.remove(to_rm)
    invisible(res)
}


### Manuscript -----------------------------------

make_ms <- function() {
    rmarkdown::render("manuscript-functional.Rmd", "pdf_document")
    invisible(file.exists("manuscript-functional.pdf"))
}

clean_ms <- function() {
    res <- file.remove("manuscript-functional.pdf")
    invisible(res)
}

### Tests ----------------------------------------

make_tests <- function() {
    if (require(testthat)) {
        test_dir("tests/")
    }
}

### Everything -----------------------------------

make_all <- function() {
    make_data()
    make_figures()
    make_tests()
    make_ms()
}

clean_all <- function() {
    clean_data()
    clean_figures()
    clean_ms()
}
