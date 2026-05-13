PROJNAME=thesis

.PHONY: all clean cleanall

all: $(PROJNAME).pdf

$(PROJNAME).pdf: $(PROJNAME).tex BYUPhys.cls gzlogo.png references.bib
	# Full LaTeX/BibTeX cycle.
	rm -f $(PROJNAME).aux $(PROJNAME).bbl $(PROJNAME).blg $(PROJNAME).out $(PROJNAME).log $(PROJNAME).toc
	pdflatex -interaction=nonstopmode -halt-on-error $(PROJNAME).tex
	bibtex8 $(PROJNAME)
	pdflatex -interaction=nonstopmode -halt-on-error $(PROJNAME).tex
	pdflatex -interaction=nonstopmode -halt-on-error $(PROJNAME).tex

clean:
	rm -f $(PROJNAME).aux $(PROJNAME).blg $(PROJNAME).log $(PROJNAME).out

cleanall: clean
	rm -f $(PROJNAME).bbl $(PROJNAME).pdf $(PROJNAME).toc
