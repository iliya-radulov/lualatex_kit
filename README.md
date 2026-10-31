<img width="1376" height="768" alt="overhead flat-lay still life, ag 96545 ocx" src="https://github.com/user-attachments/assets/903109c0-98a6-430f-be01-0a56ba5402d3" />

# Modern LuaLaTeX Starter Kit for Computational Linguistics

A small teaching collection for students of **computational linguistics** who also work with **Romance languages** (French, Spanish, Italian, Portuguese, Romanian). Everything in this kit is written for a current (2026) TeX Live installation and uses **LuaLaTeX**, not pdfLaTeX.

The kit exists because most LuaLaTeX material online is more than ten years old and recommends packages that no longer behave well with the current TeX Live. It is aimed at students who already know some classical LaTeX and now have to switch to LuaLaTeX for a linguistics course.

## What's in this repo

| File | What it is | When to use it |
|---|---|---|
| `modern-lualatex-guide.tex` | Narrative tutorial. Why LuaLaTeX, what to use instead of the old pdfLaTeX packages, and how to build a safe preamble. | Read this first. |
| `cl-cheatsheet.tex` | Short reference: math symbols, IPA, glosses, trees, polyglossia. | Keep it printed next to the keyboard. |
| `cs-starter.tex` | Minimal, commented template for a new assignment. | Copy, rename, start writing. |
| `romance-comp-ling.tex` | Worked example focused on Romance languages: French/Spanish/Portuguese/Romanian text, IPA, glosses, syntax trees, a dependency-parsing table. | A reference for seeing features in action. |

## Ubuntu setup (the easy way)

### 1. Install a full TeX Live

```bash
sudo apt update
sudo apt install texlive-full
```

`texlive-full` is large (5–8 GB) but after this you will never hit a "package not found" error again. If disk space is tight, this smaller selection covers 99 % of linguistics needs:

```bash
sudo apt install texlive-latex-extra texlive-lang-all \
                 texlive-fonts-extra texlive-science
```

### 2. Install an editor (optional)

```bash
sudo apt install texstudio
```

Then open **Options → Configure TeXstudio → Build** and change the default compiler to **LuaLaTeX**.

### 3. Add linguistic fonts

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
- **Two compilation passes:** LuaLaTeX often needs to be run twice to resolve the table of contents and cross-references. With a bibliography: LuaLaTeX → Biber → LuaLaTeX → LuaLaTeX.
- **Do not copy preambles from pre-2015 tutorials.** They will tell you to load `inputenc`, `fontenc`, `textcomp` and `tipa`. Under LuaLaTeX these are at best unneeded and at worst broken. Use `fontspec`, `polyglossia` and `tipauni` instead.

## Credits

This kit was motivated by Manuel Pégourié-Gonnard's **"A Guide to LuaLaTeX"** (2010), one of the earliest attempts to help newcomers find their way into the then-new LuaLaTeX world. The 2026 landscape is very different, but the effort behind the original guide deserves acknowledgement. See [`CREDITS.md`](CREDITS.md).

## License

Released under the **MIT License** — see [`LICENSE`](LICENSE).

---

Feedback and suggestions for improvement are most welcome.
