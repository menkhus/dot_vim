" ============================================================
" MacVim — Writing Surface GUI settings
" Loaded on top of ~/.vimrc — MacVim only
" ============================================================

" ── Client-server ────────────────────────────────────────────
if has('gui_running') && empty(v:servername)
  call remote_startserver('MARKSVIM')
endif

" ── Appearance ───────────────────────────────────────────────
set guifont=JetBrains\ Mono:h14
set lines=52 columns=120
set linespace=4
set background=dark

" Clean chrome — no toolbar, no scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Show tab bar only when more than one tab is open
set showtabline=1

" ── Writing comfort ──────────────────────────────────────────
set wrap
set linebreak
set nolist

" Navigate display lines (wrapped) naturally
nnoremap j gj
nnoremap k gk

" ── Project root detection ────────────────────────────────────
" Walks up from the current file until it finds Makefile.
" Works correctly from any project subdirectory.
function! ProjectRoot()
  let l:dir = expand('%:p:h')
  while l:dir !=# '/' && !filereadable(l:dir . '/Makefile')
    let l:dir = fnamemodify(l:dir, ':h')
  endwhile
  return l:dir
endfunction

" ── Writing Surface menu ─────────────────────────────────────

" Navigate
nmenu WritingSurface.Navigate.Open\ Chapter\.\.\.    :call OpenChapter()<CR>
nmenu WritingSurface.Navigate.Table\ of\ Contents    :call EditProjectFile('TOC.md')<CR>
nmenu WritingSurface.Navigate.Outline                :call EditProjectFile('continuity/outline.md')<CR>
nmenu WritingSurface.Navigate.Character\ Bible       :call EditProjectFile('continuity/character_story_bible.md')<CR>
nmenu WritingSurface.Navigate.Ending\ Notes          :call EditProjectFile('continuity/step_12_the_ending.md')<CR>
nmenu WritingSurface.Navigate.Todo                   :call EditProjectFile('work_tracking/todo.md')<CR>
nmenu WritingSurface.Navigate.Writing\ Help          :e ~/.vim/writing_help.md<CR>

" Writing Context
nmenu WritingSurface.Writing\ Context.Chapter\ +\ Promise\ +\ Help  :call OpenWritingLayout()<CR>
nmenu WritingSurface.Writing\ Context.Chapter\ +\ Bible             :call OpenWritingContext()<CR>
nmenu WritingSurface.Writing\ Context.All\ Continuity               :call OpenContinuity()<CR>

" Analyze
nmenu WritingSurface.Analyze.Word\ Count             :call RunMake('wc')<CR>
nmenu WritingSurface.Analyze.Word\ Count\ History    :call RunMake('log')<CR>
nmenu WritingSurface.Analyze.Continuity\ Report      :call RunMake('report')<CR>
nmenu WritingSurface.Analyze.Metadata\ Health        :call RunMake('health')<CR>
nmenu WritingSurface.Analyze.Edit\ Readiness         :call RunMake('edit-ready')<CR>
nmenu WritingSurface.Analyze.Coaching                :call RunMake('coach')<CR>

" Design
nmenu WritingSurface.Design.Open\ in\ Excel          :call OpenInExcel()<CR>
nmenu WritingSurface.Design.Import\ from\ Excel      :call RunMake('import')<CR>
nmenu WritingSurface.Design.Regenerate\ TOC          :call RunMake('toc')<CR>

" Lint  (ALE — off by default per writing surface principle; explicit opt-in)
nmenu WritingSurface.Lint.Structure\ (markdownlint)  :call LintStructure()<CR>
nmenu WritingSurface.Lint.Prose\ Quality             :call LintProse()<CR>
nmenu WritingSurface.Lint.Clear\ All\ Linting        :call LintClear()<CR>
nmenu WritingSurface.Lint.-sep1-                     <Nop>
nmenu WritingSurface.Lint.Next\ Error                :ALENextWrap<CR>
nmenu WritingSurface.Lint.Previous\ Error            :ALEPreviousWrap<CR>
nmenu WritingSurface.Lint.Error\ Detail              :ALEDetail<CR>

" Search
nmenu WritingSurface.Search.Search\ All\ Files\.\.\.  :call SearchAllFiles()<CR>
nmenu WritingSurface.Search.Search\ This\ Chapter      :BLines<CR>
nmenu WritingSurface.Search.Recent\ Files              :History<CR>
nmenu WritingSurface.Search.-sep1-                     <Nop>
nmenu WritingSurface.Search.Fuzzy\ Find\ File          :Files<CR>
nmenu WritingSurface.Search.Open\ Buffer               :Buffers<CR>

" Version
nmenu WritingSurface.Version.Save\ Checkpoint          :call RunMake('commit')<CR>
nmenu WritingSurface.Version.-sep1-                    <Nop>
nmenu WritingSurface.Version.Preview\ Changed\ Hunk    :GitGutterPreviewHunk<CR>
nmenu WritingSurface.Version.Stage\ This\ Hunk         :GitGutterStageHunk<CR>
nmenu WritingSurface.Version.Undo\ This\ Hunk          :GitGutterUndoHunk<CR>
nmenu WritingSurface.Version.Fold\ Unchanged\ Lines    :GitGutterFold<CR>
nmenu WritingSurface.Version.-sep2-                    <Nop>
nmenu WritingSurface.Version.Git\ Status               :Git status<CR>
nmenu WritingSurface.Version.Git\ Diff                 :Git diff<CR>
nmenu WritingSurface.Version.Git\ Blame                :Git blame<CR>
nmenu WritingSurface.Version.Git\ Commit               :Git commit<CR>
nmenu WritingSurface.Version.-sep3-                    <Nop>
nmenu WritingSurface.Version.Git\ Log\ This\ File      :BCommits<CR>
nmenu WritingSurface.Version.Time\ Travel\.\.\.        :call TimeTravelPrompt()<CR>

" Focus
nmenu WritingSurface.Focus.Focus\ Mode\ (Goyo)             :Goyo<CR>
nmenu WritingSurface.Focus.-sep1-                          <Nop>
nmenu WritingSurface.Focus.Typewriter\ On                  :set scrolloff=999<CR>
nmenu WritingSurface.Focus.Typewriter\ Off                 :set scrolloff=5<CR>
nmenu WritingSurface.Focus.-sep2-                          <Nop>
nmenu WritingSurface.Focus.Limelight\ On                   :Limelight<CR>
nmenu WritingSurface.Focus.Limelight\ Off                  :Limelight!<CR>
nmenu WritingSurface.Focus.-sep3-                          <Nop>
nmenu WritingSurface.Focus.Paragraph\ Span:\ Current\ Only :call SetLimelightSpan(0)<CR>
nmenu WritingSurface.Focus.Paragraph\ Span:\ +1\ Neighbor  :call SetLimelightSpan(1)<CR>
nmenu WritingSurface.Focus.Paragraph\ Span:\ +2\ Each      :call SetLimelightSpan(2)<CR>

" Settings
nmenu WritingSurface.Settings.Toggle\ Spell\ Check         :set spell!<CR>
nmenu WritingSurface.Settings.Toggle\ Line\ Numbers        :set number! relativenumber!<CR>
nmenu WritingSurface.Settings.-sep1-                       <Nop>
nmenu WritingSurface.Settings.Edit\ .vimrc                 :e ~/.vimrc<CR>
nmenu WritingSurface.Settings.Edit\ .gvimrc                :e ~/.gvimrc<CR>
nmenu WritingSurface.Settings.Reload\ .gvimrc              :source ~/.gvimrc \| echo 'gvimrc reloaded'<CR>

" ── Helper functions ──────────────────────────────────────────

function! EditProjectFile(relpath)
  execute "e " . fnameescape(ProjectRoot() . '/' . a:relpath)
endfunction

function! RunMake(target)
  execute "!cd " . fnameescape(ProjectRoot()) . " && make " . a:target
endfunction

function! OpenChapter()
  execute "Files " . fnameescape(ProjectRoot() . '/content')
endfunction

function! OpenInExcel()
  execute "!cd " . fnameescape(ProjectRoot()) . " && make export && open work_tracking/chapter_metadata.csv"
endfunction

function! OpenWritingLayout()
  let l:base    = expand('%:t:r')
  let l:root    = ProjectRoot()
  let l:promise = l:root . '/promises/' . l:base . '_promise.md'
  execute 'botright 15split ' . fnameescape(l:promise)
  wincmd k
  execute 'vsplit ' . fnameescape(expand('~/.vim/writing_help.md'))
  wincmd h
endfunction

function! OpenWritingContext()
  let l:root = ProjectRoot()
  execute "vsplit " . fnameescape(l:root . '/continuity/character_story_bible.md')
  wincmd h
endfunction

function! OpenContinuity()
  let l:root = ProjectRoot()
  execute "e "      . fnameescape(l:root . '/continuity/outline.md')
  execute "vsplit " . fnameescape(l:root . '/continuity/character_story_bible.md')
  execute "split "  . fnameescape(l:root . '/continuity/step_12_the_ending.md')
endfunction

function! SearchAllFiles()
  let l:term = input("Search all files: ")
  if l:term != ""
    execute "Rg " . fnameescape(l:term)
  endif
endfunction

function! TimeTravelPrompt()
  let l:ref = input("Git ref (HEAD~3, main, abc123): ")
  if l:ref != ""
    execute "Gedit " . l:ref . ":%"
  endif
endfunction

function! LintStructure()
  let g:ale_linters = {'markdown': ['markdownlint']}
  ALEEnable
  ALELint
endfunction

function! LintProse()
  let g:ale_linters = {'markdown': ['vale', 'proselint', 'writegood']}
  ALEEnable
  ALELint
endfunction

function! LintClear()
  ALEDisable
  let g:ale_linters = {'markdown': []}
endfunction

function! SetLimelightSpan(n)
  let g:limelight_paragraph_span = a:n
  if exists('#limelight')
    Limelight!
    Limelight
  endif
endfunction

" ── Split layout feel ─────────────────────────────────────────
set splitright
set splitbelow
set winwidth=85
set winminwidth=20
