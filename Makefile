all: test manuscripts

manuscript-inline.pdf: manuscript-inline.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

manuscript-functional.pdf: manuscript-functional.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

test:
	Rscript -e "library(testthat); source('make.R'); test_dir('tests/')"

manuscripts: manuscript-inline.pdf manuscript-functional.pdf

.PHONY: all test manuscripts
