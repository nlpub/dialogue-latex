\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dialogue}

\LoadClass[12pt,a4paper]{article}

\usepackage[left=3cm,top=2cm,bottom=2cm,right=1.5cm]{geometry}
\usepackage[T1,T2A]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[russian,english]{babel}
\usepackage{amsmath,amssymb}
\usepackage{titling}
\usepackage{graphicx}
\usepackage{xcolor}

\usepackage{footmisc}
\def\footnotelayout{\color{blue}}

\everymath{\color{red}}
\everydisplay{\color{red}}
\date{}

\bibliographystyle{plain}

\renewcommand*{\usepackage}{\PackageError{dialogue}{please do not use extra packages}}
\renewcommand*{\input}{\PackageError{dialogue}{please do not include other documents}}
\renewcommand*{\include}{\PackageError{dialogue}{please do not include other documents}}
