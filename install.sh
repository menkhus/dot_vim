#!/bin/zsh
# ~/.vim/install.sh
# Full vim writing environment install — run once on a new machine
# After running: open vim and run :PlugInstall

set -e

echo "==> Installing system tools..."
brew install fzf aspell vale llvm

echo "==> Installing prose linters..."
npm install -g markdownlint-cli write-good
pip install proselint python-lsp-server

echo "==> Installing TypeScript language server..."
npm install -g typescript typescript-language-server

echo "==> Adding llvm to PATH in ~/.zshrc..."
if ! grep -q 'llvm/bin' ~/.zshrc; then
  echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.zshrc
fi

echo "==> Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "==> Creating spell and thesaurus directories..."
mkdir -p ~/.vim/spell
mkdir -p ~/.vim/thesaurus

echo "==> Downloading Moby thesaurus..."
curl -L https://raw.githubusercontent.com/words/moby/master/words.txt \
  -o ~/.vim/thesaurus/english.txt

echo "==> Copying vimrc..."
cp ~/.vim/.vimrc ~/.vimrc
cp ~/.vim/.gvimrc ~/.gvimrc

echo ""
echo "Done. Now open vim and run:  :PlugInstall"
echo "Then restart vim."
echo ""
echo "Plugins installed:"
echo "  ale           — async linting (prose + code)"
echo "  goyo          — distraction-free mode"
echo "  limelight     — paragraph focus"
echo "  fzf + fzf.vim — fuzzy file finder"
echo "  vim-fugitive  — git inside vim"
echo "  vim-gitgutter — git changes in gutter"
echo ""
echo "Language servers:"
echo "  python-lsp-server  — Python autocomplete"
echo "  typescript-language-server — TS/JS autocomplete"
echo "  clangd (via llvm)  — C/C++ autocomplete"
echo "  sourcekit-lsp      — Swift (comes with Xcode)"
echo ""
echo "Prose linters (via ALE):"
echo "  markdownlint  — markdown rules"
echo "  vale          — style guide enforcement"
echo "  proselint     — prose quality"
echo "  write-good    — passive voice, weasel words"
echo "  aspell        — spell check"
