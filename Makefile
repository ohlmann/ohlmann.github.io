.PHONY: serve build install
serve:
	jekyll serve
build:
	jekyll build
install: build
	rsync -Pavh _site/ ${AFS}/.html-data/blog
