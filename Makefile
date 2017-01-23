PAPER = thesis
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)
INTRO = intro/intro.tex
ABS = abstract/abstract.tex
BACKGROUND = background/background.tex
METHODOLOGY = methodology/methodology.tex
ASPLOS2015 = asplos2015/*.tex
HPCA2015 = hpca2015/*.tex
HPCA2016 = hpca2016/*.tex
THERMOSTAT = asplos2017/*.tex

.PHONY: all clean

$(PAPER).pdf: $(TEX) $(INTRO) $(ABS) $(BACKGROUND) $(ASPLOS2015)\
	$(METHODOLOGY) $(HPCA2015) $(HPCA2016) $(THERMOSTAT) $(BIB)
	#echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out $(PAPER).pdf

