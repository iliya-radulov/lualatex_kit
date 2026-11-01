# .latexmkrc for the Modern LuaLaTeX Kit for Computational Linguistics
#
# With this file in the repo, a simple
#     latexmk file.tex
# compiles the document the right way. You do NOT need to type the
# engine name or the biber flag --- latexmk reads this file and knows.
#
# Equivalent manual command without this file:
#     latexmk -lualatex -pdf file.tex

$pdf_mode  = 4;   # 4 = LuaLaTeX. (1 = pdflatex, 2 = ps2pdf, 3 = dvipdf, 5 = xelatex)
$bibtex_use = 2;  # Run Biber whenever a bibliography is present.

# Clean up extra auxiliary files when running `latexmk -c` or `-C`.
$clean_ext = "bbl run.xml synctex.gz";
