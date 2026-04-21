" ============================================================
" ~/.vimrc — Writing environment for markdown prose
" Based on: tools/vim-markdown-writing-setup.md
"
" Plugins managed by vim-plug. After editing this file, open
" vim and run :PlugInstall to install plugins.
"
" Tools required (see vim-markdown-writing-setup.md):
"   brew install aspell vale macvim
"   npm install -g markdownlint-cli write-good
"   pip install proselint
" ============================================================


" ============================================================
" Plugin Manager (vim-plug)
" ============================================================
call plug#begin('~/.vim/plugged')

  Plug 'dense-analysis/ale'           " Async linting — runs all prose tools
  Plug 'junegunn/goyo.vim'            " Distraction-free writing mode
  Plug 'junegunn/limelight.vim'       " Focus on current paragraph

call plug#end()


" ============================================================
" General
" ============================================================
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set autoread                          " Reload files changed outside vim
set hidden                            " Allow unsaved buffers in background
set backspace=indent,eol,start        " Sane backspace
set history=500
set swapfile
set nobackup
set mouse=a


" ============================================================
" Appearance
" ============================================================
set number                            " Line numbers
set relativenumber                    " Relative line numbers
set wrap                              " Wrap long lines
set linebreak                         " Wrap at word boundaries
set scrolloff=5                       " Keep 5 lines above/below cursor
set textwidth=0                       " Don't hard-wrap
set colorcolumn=0                     " No column marker for prose
syntax enable


" ============================================================
" Spell Checking (built-in, no plugin needed)
" ============================================================
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
set thesaurus=~/.vim/thesaurus/english.txt
set dictionary=/usr/share/dict/words

" Spell check key bindings (documented, vim built-in)
" ]s  — next misspelled word
" [s  — previous misspelled word
" z=  — show suggestions for word under cursor
" zg  — add word to personal dictionary
" zw  — mark word as misspelled
" zug — undo adding word to dictionary


" ============================================================
" Prose writing settings for markdown
" ============================================================
autocmd FileType markdown setlocal number
autocmd FileType markdown setlocal relativenumber
autocmd FileType markdown setlocal wrap
autocmd FileType markdown setlocal linebreak
autocmd FileType markdown setlocal scrolloff=3


" ============================================================
" ALE — Async Lint Engine
" Runs: markdownlint, vale, proselint, write-good
" ============================================================
let g:ale_linters = {
  \ 'markdown': ['markdownlint', 'vale', 'proselint', 'write-good'],
  \ }

" Only lint on save and when leaving insert mode (less distracting)
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1

" Show errors in status line
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error   = '✗'
let g:ale_sign_warning = '⚠'

" Navigate between errors
nmap <C-j> <Plug>(ale_next_wrap)
nmap <C-k> <Plug>(ale_previous_wrap)

" ALE commands reference:
" :ALELint     — run linters manually
" :ALEFix      — auto-fix where possible
" :ALEInfo     — show linter status and paths
" :ALENext     — jump to next error
" :ALEPrevious — jump to previous error


" ============================================================
" Goyo — distraction-free mode
" ============================================================
let g:goyo_width  = 80
let g:goyo_height = '90%'

" Toggle with <Leader>g (default leader is \)
nnoremap <Leader>g :Goyo<CR>

" Auto-enable Limelight when Goyo is active
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ============================================================
" vim-markdown settings
" ============================================================
let g:vim_markdown_folding_disabled = 1   " No folding by default
let g:vim_markdown_conceal = 0            " Show raw markdown, not concealed


" ============================================================
" Status line
" ============================================================
set laststatus=2
set statusline=
set statusline+=\ %f                      " Filename
set statusline+=\ %m                      " Modified flag
set statusline+=%=                        " Right side
set statusline+=\ %{&spelllang}           " Spell language
set statusline+=\ \|\ %l/%L              " Line / total lines
set statusline+=\ \|\ %p%%\             " Percentage


" ============================================================
" Key mappings
" ============================================================
" Toggle spell check
nnoremap <Leader>s :set spell!<CR>

" Toggle line numbers
nnoremap <Leader>n :set number!<CR>

" Quick save
nnoremap <Leader>w :w<CR>

" Open this vimrc
nnoremap <Leader>v :e ~/.vimrc<CR>

" Run prose_check.py on current file (from project root)
nnoremap <Leader>p :!python assembly/prose_check.py %<CR>
