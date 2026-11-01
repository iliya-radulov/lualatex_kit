<img width="1376" height="768" alt="overhead flat-lay still life, ag 96545 ocx" src="https://github.com/user-attachments/assets/903109c0-98a6-430f-be01-0a56ba5402d3" />

# Modern LuaLaTeX Starter Kit for Computational Linguistics

A small teaching collection for students of **computational linguistics** who also work with **Romance languages** (French, Spanish, Italian, Portuguese, Romanian). Everything in this kit is written for a current (2026) TeX Live installation and uses **LuaLaTeX**, not pdfLaTeX.

The kit exists because most LuaLaTeX material online is more than ten years old and recommends packages that no longer behave well with the current TeX Live. It is aimed at students who already know some classical LaTeX and now have to switch to LuaLaTeX for a linguistics course.

## Quick start – which file should I open?
1. New to LuaLaTeX? → Start with [`modern-lualatex-guide.tex`](https://github.com/iliya-radulov/lualatex_kit/blob/main/modern-lualatex-guide.tex)
2. Want a clean template to copy? → Use [`cs-starter.tex`](https://github.com/iliya-radulov/lualatex_kit/blob/main/cs-starter.tex)
3. Need a quick reference while writing? → Keep [`cl-cheatsheet.tex`](https://github.com/iliya-radulov/lualatex_kit/blob/main/cl-cheatsheet.tex) open
4. Working on a specific task? → See the worked examples: Romance languages, corpus statistics, or Praat phonetics (table below).

## What's in this repo

| File | What it is | When to use it |
|---|---|---|
| `modern-lualatex-guide.tex` | Narrative tutorial. Why LuaLaTeX, what to use instead of the old pdfLaTeX packages, how to build a safe preamble, and how to automate compilation with `latexmk`. | Read this first. |
| `cl-cheatsheet.tex` | Short reference: math symbols, IPA, glosses, trees, polyglossia, and extension packages (`csquotes`, `siunitx`, `pgfplots`, `microtype`). | Keep it printed next to the keyboard. |
| `cs-starter.tex` | Minimal, commented template for a new assignment. | Copy, rename, start writing. |
| `romance-comp-ling.tex` | Worked example focused on Romance languages: French/Spanish/Portuguese/Romanian text with language-aware quotes, IPA, glosses, syntax trees, dependency parsing. | A reference for seeing features in action. |
| `corpus-stats.tex` | Worked example for quantitative work: `siunitx`-aligned statistical tables with properly formatted *p*-values, a vector `pgfplots` Zipf plot, and a note on reading data from CSV. | For corpus-linguistics assignments and thesis chapters. |
| `praat-pipeline.tex` | Worked example for phonetics: embed a Praat spectrogram as PDF and overlay phoneme / word / gloss tiers with TikZ, including the time-to-coordinate scaling formula. | For any phonetics or acoustic-analysis coursework. |

## Ubuntu setup (the easy way)

### 1. Install TeX Live

The focused install below covers 99 % of linguistics needs and is kinder to your disk than the full distribution:

```bash
sudo apt update
sudo apt install texlive-latex-recommended texlive-latex-extra \
                 texlive-lang-european texlive-fonts-extra \
                 texlive-science texlive-luatex latexmk
```

If you would rather not worry about missing packages ever, install the full distribution instead (5–8 GB):

```bash
sudo apt install texlive-full
```

### 2. Verify your first compile

From the folder containing the kit's files:

```bash
latexmk -lualatex cs-starter.tex
```

A successful run ends with a line like `Latexmk: All targets (cs-starter.pdf) are up-to-date` and leaves a `cs-starter.pdf` next to the `.tex` file. If you cloned this repo, the included `.latexmkrc` means you can even drop the `-lualatex` flag — just `latexmk cs-starter.tex` works.

### 3. Install an editor (optional)

```bash
sudo apt install texstudio
```

Then open **Options → Configure TeXstudio → Build** and change the default compiler to **LuaLaTeX**.

### 4. Add linguistic fonts

For IPA and Romance special characters, **Charis SIL** and **Doulos SIL** are excellent and free. Download the `.ttf` files, then:

```bash
mkdir -p ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts/
fc-cache -fv
```

LuaLaTeX will find them the next time you compile. On macOS or Windows the font database is refreshed differently — see the troubleshooting section in `modern-lualatex-guide.tex`.

Then uncomment this line in any template:

```latex
\setmainfont{Charis SIL}
```

## Known gotchas

- **`gb4e` + modern packages:** always put `\noautomath` right after `\usepackage{gb4e}`. Without it, any example containing a subscript or superscript will crash. This is the #1 reason linguistics students give up on LaTeX. Every template in this repo already does this.
- **Two compilation passes:** LuaLaTeX often needs to be run twice to resolve the table of contents and cross-references. With a bibliography the full sequence is LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX. Don't do this manually: `latexmk -lualatex -pdf your-document.tex` handles the whole dance automatically and stops when the output is stable. `latexmk` ships with every modern TeX Live.
- **Do not copy preambles from pre-2015 tutorials.** They will tell you to load `inputenc`, `fontenc`, `textcomp` and `tipa`. Under LuaLaTeX these are at best unneeded and at worst broken. Use `fontspec`, `polyglossia` and `tipauni` instead.

## Tested with

Last verified **2026-11-01** on:

- TeX Live 2026
- LuaLaTeX 1.18.x
- latexmk 4.85x
- Ubuntu 24.04 LTS *and* macOS Tahoe 26.6.2
- Editor: TeXstudio 6.0.2 (Linux), Texmaker 6.0.2 (macOS)

If your versions are substantially older or newer, the kit will almost certainly still work, but the exact wording of error messages may differ from the troubleshooting table in `modern-lualatex-guide.tex`.

## Credits

This kit was motivated by Manuel Pégourié-Gonnard's **"A Guide to LuaLaTeX"** (2010), one of the earliest attempts to help newcomers find their way into the then-new LuaLaTeX world. The 2026 landscape is very different, but the effort behind the original guide deserves acknowledgement. See [`CREDITS.md`](CREDITS.md).

## License

Released under the **MIT License** — see [`LICENSE`](LICENSE).

---

Feedback and suggestions for improvement are most welcome.
