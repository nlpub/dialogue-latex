DOCUMENT := dialogue

view: $(DOCUMENT).pdf
	xdg-open $<

.PHONY: $(DOCUMENT).pdf
$(DOCUMENT).pdf:
	latexmk -pdf $(DOCUMENT)

.PHONY: $(DOCUMENT).icml
$(DOCUMENT).icml:
	pandoc -s -f latex -t icml -o $@ --bibliography=$(DOCUMENT).bib --filter pandoc-citeproc --csl=splncs.csl $(DOCUMENT).tex

.PHONY: $(DOCUMENT).docx
$(DOCUMENT).docx:
	pandoc -s -f latex -t docx -o $@ --bibliography=$(DOCUMENT).bib --filter pandoc-citeproc --csl=splncs.csl $(DOCUMENT).tex

.PHONY: $(DOCUMENT).xml
$(DOCUMENT).xml:
	latexml $(DOCUMENT) --destination=$@

.PHONY: $(DOCUMENT).html
$(DOCUMENT).html: $(DOCUMENT).xml
	latexmlpost --format=html5 --nopresentationmathml --mathsvg --svg --destination=$@ $<

.PHONY: $(DOCUMENT).rtf
$(DOCUMENT).rtf: $(DOCUMENT).html
	soffice --convert-to 'rtf:Rich Text Format' $(DOCUMENT).html --headless

clean:
	latexmk -C -pdf $(DOCUMENT)
	rm -fv *-converted-to.pdf
	rm -fv $(DOCUMENT).{xml,html,icml,docx,rtf,pdf,bbl}
	rm -fv LaTeXML.cache LaTeXML.css ltx-article.css
