
assets/twitterlogo.svg:
	mkdir -p assets
	wget -O $@ https://upload.wikimedia.org/wikipedia/commons/6/6f/Logo_of_Twitter.svg

assets/github.zip:
	mkdir -p assets
	wget -O $@ https://github.githubassets.com/assets/github-mark-c791e9551fe4.zip

assets/github-mark.svg: assets/github.zip
	unzip -d assets assets/github.zip
	cp assets/github-mark/github-mark.svg $@

talks.yaml: talks.bib 
	hayagriva $< > $@ 

dmas.yaml: dmas.bib 
	hayagriva $< > $@

cv.pdf: cv.typ dmas.yaml talks.yaml assets/twitterlogo.svg assets/github-mark.svg
	typst compile $<

all: cv.pdf
