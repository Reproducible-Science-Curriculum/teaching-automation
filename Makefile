all: manuscript.html manuscript.pdf

manuscript.html: manuscript.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'html_document')"

manuscript.pdf: manuscript.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

.PHONY: all
