# LaTeX Template for the Dialogue Conference

Proceedings of the [Dialogue](http://www.dialog-21.ru/en/) conference are typeset in the Adobe InDesign suite which is not compatible with LaTeX. However, it is possible to convert LaTeX documents to the InDesign format, ICML, using [Pandoc](https://pandoc.org). This template aims at following the conference [requirements](http://www.dialog-21.ru/en/guidelines/), so you can submit papers in your favourite typesetting system.

[![Build Status](https://travis-ci.org/nlpub/dialogue-latex.svg?branch=master)](https://travis-ci.org/nlpub/dialogue-latex)

This work is in the public domain and offered as-is without any warranties, see [LICENSE.txt](LICENSE.txt) for details.

## Thanks!

If you found this template useful and would like to support its author, here is the link: <https://yasobe.ru/na/nlpub>.

## Why are some parts of the document in red or blue?

These colors help the publisher to transfer your content into the final template using InDesign. This is not a mistake and is done intentionally.

## Why cannot I use extra packages or modify `dialogue.cls`?

The conversion process from LaTeX to InDesign is *highly error-prone*. The available features are strictly limited to provide a stable subset of functionality.

## Guidelines

***Do...***

* use the `dialogue` document class
* make sure that your document compiles with zero errors
* keep the document layout as simple as possible
* use BibTeX to format the bibliography
* run the conversion command on your machine

***Do Not...***

* modify `dialogue.cls` in any way
* use any packages or features not included in the template
* use `\ref` in the document
* use `tabular` inside `tabular`

## Conversion

We recommend using the following command for conversion:

```shell
pandoc -s -f latex -t icml -o dialogue.icml --bibliography=dialogue.bib --filter pandoc-citeproc --csl=splncs.csl dialogue.tex
```

This command converts your document `dialogue.tex` and bibliography `dialogue.bib` to `dialogue.icml`. The `splncs.csl` style is used for bibliography conversion (provided in the repository). Warnings that are related to formulas are OK.

InDesign files are XML documents. Unfortunately, sometimes Pandoc produces non-well-formed XML. Please run the following command to verify this:

```shell
xmllint --noout dialogue.icml
```

If error messages are shown, try modifying the `dialogue.icml` file in any text editor to ensure that no errors are shown.
