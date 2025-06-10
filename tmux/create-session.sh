#!/bin/bash
# tmux/create-session.sh - Создание стандартной рабочей сессии

set -euo pipefail

SESSION_NAME="${1:-work}"
PROJECT_PATH="${2:-$PWD}"

# Проверка существования сессии
if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "⚠️  Session '$SESSION_NAME' already exists, attaching..."
    tmux attach-session -t "$SESSION_NAME"
    exit 0
fi

echo "🚀 Creating session '$SESSION_NAME' in '$PROJECT_PATH'"

# Создаем сессию с первым окном
tmux new-session -d -s "$SESSION_NAME" -c "$PROJECT_PATH"

# Окно 1: vim
tmux rename-window -t "$SESSION_NAME:0" "vim"
tmux send-keys -t "$SESSION_NAME:0" "clear" Enter

# Окно 2: terminal
tmux new-window -t "$SESSION_NAME" -n "term" -c "$PROJECT_PATH"
tmux send-keys -t "$SESSION_NAME:1" "clear" Enter

# Окно 3: tig
tmux new-window -t "$SESSION_NAME" -n "tig" -c "$PROJECT_PATH"
tmux send-keys -t "$SESSION_NAME:2" "tig" Enter

# Окно 4: docker
tmux new-window -t "$SESSION_NAME" -n "docker" -c "$PROJECT_PATH"
tmux send-keys -t "$SESSION_NAME:3" "clear && docker ps" Enter

# Окно 5: lnav
tmux new-window -t "$SESSION_NAME" -n "lnav" -c "$PROJECT_PATH"
tmux send-keys -t "$SESSION_NAME:4" "clear" Enter

# Возвращаемся к vim и подключаемся
tmux select-window -t "$SESSION_NAME:0"
tmux attach-session -t "$SESSION_NAME"