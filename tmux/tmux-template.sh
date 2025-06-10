#!/bin/bash

# Configuration
SESSION_NAME="work"
PROJECT_DIR="/Users/apozdniakov/codebase/apozdniakov/payroll-checker"

echo "🚀 Creating session '$SESSION_NAME' in '$PROJECT_DIR'"

# Check if session already exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null
if [ $? != 0 ]; then
    # Create new session with first window "vim"
    tmux new-session -s "$SESSION_NAME" -n vim -d
    
    # Navigate to project directory and start vim
    tmux send-keys -t "$SESSION_NAME" "cd $PROJECT_DIR" C-m
    tmux send-keys -t "$SESSION_NAME" 'vim' C-m
    
    # Create "term" window with vertical split 30/70
    tmux new-window -n term -t "$SESSION_NAME"
    tmux send-keys -t "$SESSION_NAME:term" "cd $PROJECT_DIR" C-m
    tmux split-window -h -t "$SESSION_NAME:term.1"
    tmux resize-pane -t "$SESSION_NAME:term.2" -p 30
    tmux send-keys -t "$SESSION_NAME:term.2" "cd $PROJECT_DIR" C-m
    
    # Create "git" window and start tig
    tmux new-window -n git -t "$SESSION_NAME"
    tmux send-keys -t "$SESSION_NAME:git" "cd $PROJECT_DIR" C-m
    tmux send-keys -t "$SESSION_NAME:git" 'tig' C-m
    
    # Create "docker" window
    tmux new-window -n docker -t "$SESSION_NAME"
    tmux send-keys -t "$SESSION_NAME:docker" "cd $PROJECT_DIR" C-m
    
    # Create "logs" window and start lnav
    tmux new-window -n logs -t "$SESSION_NAME"
    tmux send-keys -t "$SESSION_NAME:logs" "cd $PROJECT_DIR" C-m
    tmux send-keys -t "$SESSION_NAME:logs" 'lnav' C-m
    
    # Return to first window
    tmux select-window -t "$SESSION_NAME:1"
    
    echo "✅ Session '$SESSION_NAME' created successfully!"
else
    echo "🔗 Session '$SESSION_NAME' already exists. Attaching to it..."
fi

# Attach to session
tmux attach -t "$SESSION_NAME"
