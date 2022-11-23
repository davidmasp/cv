

cv.pdf: cv.tex scripts/compile_pdf.sh dmas.bib
	sh scripts/compile_pdf.sh

all: cv.pdf

