all: test manuscripts

manuscript-inline.pdf: manuscript-inline.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

manuscript.pdf: manuscript.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

test:
	Rscript -e "library(testthat); source('make.R'); make_tests()"

manuscripts: manuscript-inline.pdf manuscript.pdf

.PHONY: all test manuscripts
