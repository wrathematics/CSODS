SRCS=$(wildcard *.Rmd)
HTML=$(SRCS:.Rmd=.html )
PDF=$(SRCS:.Rmd=.pdf )

%.html: %.Rmd
	./bin/build.r $<
html: $(HTML)
	
%.pdf: %.html
	./bin/topdf.r $<
pdf: $(PDF)

all: html

clean:
	rm -rf *.pdf *.html
