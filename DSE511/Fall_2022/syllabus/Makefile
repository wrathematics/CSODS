SRCS=$(wildcard *.Rmd)
PDF=$(SRCS:.Rmd=.pdf )

%.pdf: %.Rmd
	Rscript -e "rmarkdown::render('$<')"
pdf: $(PDF)

all: pdf

clean:
	rm -rf *.pdf
