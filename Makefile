# Makefile for formulacion_latex.tex
#
# Copyright (C) 2022--2026 José A. Navarro Ramón <janr.devel@gmail.com>
# Licencia del código GPLv2
# Licencia Creative Commons Recognition Non-Commercial Share-alike.
# (CC-BY-NC-SA)


TARGET = formulacion_latex

IMGSTATICDIR=img/static

FILES =	formulacion_latex.pkg.sty\
	formulacion_latex.defs.sty\
	portada/portada.tex\
	tablacontenidos/tablacontenidos.tex\
	texto/mhchem.tex\
	texto/chemfig.tex\
	$(IMGSTATICDIR)/Cc-by-nc-sa_icon.pdf

$(TARGET).pdf: $(TARGET).tex $(FILES)

%.pdf:	%.tex
	lualatex $<
	lualatex $<

$(IMGSTATICDIR)/%.pdf: $(IMGSTATICDIR)/%.svg
	inkscape $< -o $@ --export-ignore-filters --export-ps-level=3

all: $(TARGET).pdf

.PHONY: clean

clean:
	rm -rf *.pdf *.ps *.dvi *.aux *.log *.toc *.out dat*~ *.dat *.script
	rm -rf auto
	rm -rf texto/*.aux texto/*~
	rm -rf ejercicios/*.aux texto/*~
	rm -rf portada/*.aux portada/*~
	rm -rf tablacontenidos/*.aux tablacontenidos/*~


