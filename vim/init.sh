#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

rm -f ~/.vimrc
ln -s "$(pwd)/vimrc" ~/.vimrc

# Install vim-plug if not exists
PLUG_PATH="$HOME/.vim/autoload/plug.vim"
if [[ ! -f "$PLUG_PATH" ]]; then
    echo "Installing vim-plug..."
    curl -fLo "$PLUG_PATH" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Vim config linked successfully"
echo "Run ':PlugInstall' in Vim to install plugins"
