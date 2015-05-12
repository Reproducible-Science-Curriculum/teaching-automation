all: manuscript-inline.html manuscript-inline.pdf manuscript-functional.html manuscript-functional.pdf

manuscript-inline.html: manuscript-inline.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'html_document')"

manuscript-inline.pdf: manuscript-inline.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"

manuscript-functional.html: manuscript-functional.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'html_document')"

manuscript-functional.pdf: manuscript-functional.Rmd
	Rscript -e "library(rmarkdown); library(knitr); render('$<', 'pdf_document')"


.PHONY: all
