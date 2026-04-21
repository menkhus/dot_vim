# dot_vim

Personal vim configuration for writing and coding.

## Install

```zsh
git clone https://github.com/menkhus/dot_vim ~/.vim
~/.vim/install.sh
cp ~/.vim/.vimrc ~/.vimrc
```

Then open vim and run `:PlugInstall`.

## ~/.zshrc addition

Add this function so vim always opens with the writing help file as a buffer:

```zsh
# vim — always opens with writing help and any files passed as arguments
# usage: vim ch01.md ch02.md
# help file is always available via :b# or \b
vim() { command vim "$@" ~/.vim/writing_help.md; }
```

Note: use explicit filenames, not globs — `vim ch00_prologue.md ch01_ordinary_world.md`
Globs can confuse vim buffer loading.

## Help files

- `writing_help.md` — vim commands, splits, plugins, make targets, install reference
- `vim_writing.md` — compact cheat sheet

Open from anywhere in vim:
```
:e ~/.vim/writing_help.md
```

## Plugins

- `ale` — async linting for prose and code
- `goyo` — distraction-free writing mode
- `limelight` — paragraph focus (auto inside Goyo)
- `fzf + fzf.vim` — fuzzy file finder (`\f`)
- `vim-fugitive` — git inside vim (`\gs`, `\gd`, `\gb`)
- `vim-gitgutter` — git changes in gutter

## Language servers (autocomplete via Ctrl-x Ctrl-o)

- `python-lsp-server` — Python
- `typescript-language-server` — TypeScript / JavaScript
- `clangd` (via llvm) — C / C++
- `sourcekit-lsp` — Swift (comes with Xcode)

## Prose linters (via ALE)

- `markdownlint`, `vale`, `proselint`, `write-good`, `aspell`
