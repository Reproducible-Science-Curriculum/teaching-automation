all: manuscript.html manuscript.pdf

manuscript.html: manuscript.Rmd
	Rscript -e "library(rmarkdown); render('$<', 'html_document')"

manuscript.pdf: manuscript.pdf
	Rscript -e "library(rmarkdown); render('$<', 'pdf_document')"

.PHONY: all
