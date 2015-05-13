all: test manuscripts

manuscript-inline.pdf: manuscript-inline.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

manuscript-functional.pdf: manuscript-functional.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

test:
	Rscript -e "library(testthat); source('make.R'); make_tests()"

manuscripts: manuscript-inline.pdf manuscript-functional.pdf

.PHONY: all test manuscripts
