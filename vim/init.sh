#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")"

rm -f ~/.vimrc
ln -s "$(pwd)/vimrc" ~/.vimrc

echo "Vim config linked successfully"
