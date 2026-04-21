WRITING SURFACE — VIM HELP
==========================

START SESSION
vim ch01_ordinary_world.md writing_surface_in_vim_help.md   open both
:b#                                          toggle between buffers
:b ch01                                      switch by partial name

SPLITS AND TERMINAL
:split                   same file horizontal split
:vsplit                  same file vertical split
:split vim_writing.md    different file horizontal split
:vsplit vim_writing.md   different file vertical split
:terminal                terminal in horizontal split
:vertical terminal       terminal in vertical split (wraps at split width)
Ctrl-w w                 cycle between splits (mouse click also works)
Ctrl-d                   close terminal and reclaim the window

3-PANE LAYOUT — chapter left, help top-right, terminal bottom-right
:vsplit ~/.vim/writing_help.md    left | right
Ctrl-w w                          move to right pane
:split                            split right pane top/bottom
Ctrl-w w                          move to bottom-right
:terminal                         terminal in bottom-right

3-PANE LAYOUT — chapter top-left, help top-right, terminal full-width bottom
:split                            top | bottom
Ctrl-w w                          move to bottom
:terminal                         terminal full width bottom
Ctrl-w w                          back to top
:vsplit ~/.vim/writing_help.md    split top pane left/right

VIM COMMANDS
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

THESAURUS AND DICTIONARY (insert mode only)
Ctrl-x Ctrl-t    synonyms for word under cursor (Moby thesaurus)
Ctrl-x Ctrl-k    dictionary word completion

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

SETTINGS
:set wrap        word wrap on
:set linebreak   wrap at word boundaries
:set spell!      toggle spell
:source ~/.vimrc reload vimrc without restarting

==========================
WRITING SURFACE MAKE TARGETS
==========================

WRITING
make check-containers              verify prose body markers in all chapters
make fix-containers                add missing prose body markers
make review CH=ch01.md             tiered review T1-T4 (writes <ch>_review.md)
make review-all                    full review pass all chapters
make review-t1                     T1 only (deterministic) fast
make raw                           open blank raw write file (no metadata)
make splat CHAPTER=ch03            append story_raw.md to chapter body
make lint                          prose linter — filter words clichés passive voice
make wc                            word count per chapter + daily log
make log                           word count history last 14 days

STORY DESIGN
make health                        metadata completeness grid
make edit-ready                    AI pass readiness per chapter
make report                        continuity audit — timeline characters foreshadowing
make coach                         emotional coaching — want/need/cost/moment
make promise                       audit every tagged promise and prose delivery
make resolve CHAPTER=ch01.md       expand promise annotations to full fields

WORD TOOLS
make thesaurus WORD=run            synonym lookup
make define WORD=run               dictionary definition

IMAGE
make period-style SOURCE=img.png   convert photo to period SVG illustration

CSV ROUND-TRIP (chapter files <-> Excel)
make excel                         open chapter_metadata.csv in Excel
make export                        chapter files -> CSV
make import                        CSV -> chapter files
make diff-csv                      show what changed in CSV since last commit

ASSEMBLY
make draft TITLE=slug              fix containers + assemble -> rough_book_<title>.md
make assemble TITLE=slug           assemble only
make toc                           regenerate TOC.md and chapter nav footers
make disassemble SOURCE=f.md       detect chapter boundaries in long document
make split SOURCE=f.md             execute boundary split -> content/ch*.md
make docx TITLE=slug               export to Word .docx

AI EDITING
make edit BEHAVIOR=edit_rhythm CHAPTER=ch01_ordinary_world.md
make edit-book BEHAVIOR=edit_pacing
make edit-precheck CHAPTER=ch01_ordinary_world.md

MAINTENANCE
make commit                        git checkpoint with today's date
make fix                           open Claude to repair broken tooling
make help                          full target reference
