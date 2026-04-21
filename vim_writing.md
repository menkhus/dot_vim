START SESSION
vim ch01_ordinary_world.md vim_writing.md   open both files
:b#                                          toggle between them
:b ch01                                      switch by partial name

SPLITS AND TERMINAL
:split                   same file horizontal split
:vsplit                  same file vertical split
:split vim_writing.md    different file horizontal split
:vsplit vim_writing.md   different file vertical split
:terminal                open terminal in horizontal split
:vertical terminal       open terminal in vertical split (wraps at split width)
Ctrl-w w                 cycle between splits
Ctrl-d                   close terminal and reclaim the window

VIM WRITING CHEAT SHEET
=======================
COMMAND          WHAT IT DOES
---------------  ----------------------------------------
TOOLS
:ALEToggle       vendors on/off
:ALELint         run linters manually
:ALEFix          auto-fix where possible
:ALEInfo         show linter status and paths
:ALENext         jump to next error
:ALEPrevious     jump to previous error
\g               Goyo distraction-free toggle
\s               spell check toggle
]s               next misspelled word
[s               previous misspelled word
z=               spelling suggestions
zg               add word to personal dictionary
zw               mark word as misspelled

EDIT
dd               delete line (also copies it)
p                paste
dap              delete paragraph
dG               delete to end of file
dgg              delete to top of file
dw               delete word
cw               change word (delete + insert mode)
u                undo
Ctrl-r           redo

NAVIGATE
/word            find
n                next match
:%s/old/new/g    replace all
gg               top of file
G                bottom of file
{ }              jump by paragraph (hard-wrap only)

THESAURUS AND DICTIONARY (insert mode only)
Ctrl-x Ctrl-t    synonyms for word under cursor (Moby thesaurus)
Ctrl-x Ctrl-k    dictionary word completion

SETTINGS
:set wrap        word wrap on
:set linebreak   wrap at word boundaries
:set spell!      toggle spell
