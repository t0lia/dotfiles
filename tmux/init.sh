#!/bin/bash
set -euo pipefail

cd ${0%/*}
rm -f ~/.tmux.conf
ln -s "$(pwd)/tmux.conf" ~/.tmux.conf
