PAPER = thesis
TEX = $(wildcard *.tex)
BIB = reference.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)
INTRO = intro/intro.tex
ABS = abstract/abstract.tex
BACKGROUND = background/background.tex
ASPLOS2015 = asplos2015/*.tex

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(INTRO) $(ABS) $(BACKGROUND) $(ASPLOS2015)
	#echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

