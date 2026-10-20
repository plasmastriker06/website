STRING1 = "Last updated on "
STRING2 = "Created using [TSPW]\(https://github.com/eakbas/TSPW\) and [pandoc]\(http://pandoc.org/\)."


RESOURCEDIR = "resources"
TARGETDIR = "build"


SOURCES = $(wildcard *.md)
HTMLs = $(patsubst %.md,build/%.html,$(SOURCES))
TEMPFILE = build/sdfgsdfs7fs8d7tfgsduifgsdi5234j

all: mkdir copy_resources $(HTMLs)

mkdir:
	mkdir -p $(TARGETDIR)

copy_resources:
	cp -r $(RESOURCEDIR) $(TARGETDIR)

build/%.html: %.md
	cat $< > $(TEMPFILE)
		printf '\n\n<div class="footer"><em>Last updated on %s. Created using <a href="https://github.com/eakbas/TSPW">TSPW</a> and <a href="https://pandoc.org/">pandoc</a>.</em></div>\n' "$$(date '+%b %d, %Y')" >> "$(TEMPFILE)"
	pandoc --mathjax -t html5 -s -c $(RESOURCEDIR)/style.css $(TEMPFILE) -o $@
	rm -f $(TEMPFILE)

clean: 
	rm -rf $(TARGETDIR)
