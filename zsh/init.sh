#!/bin/bash
set -euo pipefail

cd ${0%/*}
rm -f ~/.zshrc
ln -s "$(pwd)/.zshrc" ~/.zshrc

rm -f ~/.oh-my-zsh/custom/aliases.zsh
ln -s "$(pwd)/aliases.zsh" ~/.oh-my-zsh/custom/aliases.zsh