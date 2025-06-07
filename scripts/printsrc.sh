#!/bin/bash

# Supported source file extensions
SOURCE_EXTENSIONS=(
    # Programming languages
    "*.c" "*.cpp" "*.cc" "*.cxx" "*.h" "*.hpp"
    "*.java" "*.kt" "*.scala" "*.groovy"
    "*.py" "*.pyx" "*.pyi"
    "*.js" "*.ts" "*.jsx" "*.tsx" "*.mjs"
    "*.go" "*.rs" "*.swift" "*.rb" "*.php"
    "*.cs" "*.fs" "*.vb" "*.dart" "*.r"
    "*.sh" "*.bash" "*.zsh" "*.fish"
    "*.lua" "*.pl" "*.pm" "*.clj" "*.cljs"
    "*.hs" "*.elm" "*.ml" "*.ocaml"
    
    # Web technologies
    "*.html" "*.htm" "*.css" "*.scss" "*.sass" "*.less"
    "*.vue" "*.svelte" "*.astro"
    
    # Configuration files
    "*.json" "*.yaml" "*.yml" "*.toml" "*.ini" "*.conf"
    "*.xml" "*.plist" "*.properties" "*.env"
    "*.dockerfile" "Dockerfile*" "*.docker"
    
    # Build and dependencies
    "Makefile" "makefile" "*.mk" "*.cmake" "CMakeLists.txt"
    "package.json" "composer.json" "Cargo.toml" "go.mod"
    "pom.xml" "build.gradle" "build.sbt" "requirements.txt"
    "Pipfile" "poetry.lock"
    
    # Documentation
    "*.md" "*.rst" "*.txt" "README*" "CHANGELOG*" "LICENSE*"
)

# Directories to exclude
EXCLUDE_DIRS=(
    ".git" ".svn" ".hg"
    "node_modules" "vendor" "venv" "env" ".env"
    "target" "build" "dist" "out" "bin" "obj"
    ".gradle" ".idea" ".vscode" ".vs"
    "__pycache__" ".pytest_cache" ".coverage"
    ".next" ".nuxt" ".output"
    "coverage" "logs" "tmp" "temp"
)

# Check if file is gitignored
is_gitignored() {
    local file="$1"
    if [[ -f .gitignore ]]; then
        git check-ignore "$file" &>/dev/null
    else
        return 1
    fi
}

# Check if directory should be excluded
is_excluded_dir() {
    local path="$1"
    for exclude in "${EXCLUDE_DIRS[@]}"; do
        if [[ "$path" == *"/$exclude"* ]] || [[ "$path" == "$exclude"* ]]; then
            return 0
        fi
    done
    return 1
}

# Main function to find source files
find_source_files() {
    local find_args=()
    
    # Exclude directories
    for dir in "${EXCLUDE_DIRS[@]}"; do
        find_args+=(-name "$dir" -type d -prune -o)
    done
    
    # Add file extensions
    find_args+=(-type f \()
    for i in "${!SOURCE_EXTENSIONS[@]}"; do
        find_args+=(-name "${SOURCE_EXTENSIONS[$i]}")
        if [[ $i -lt $((${#SOURCE_EXTENSIONS[@]} - 1)) ]]; then
            find_args+=(-o)
        fi
    done
    find_args+=(\) -print)
    
    find . "${find_args[@]}" | while read -r file; do
        # Skip gitignored files
        if ! is_gitignored "$file"; then
            # Print file path header
            echo "--- $file ---"
            # Print file contents
            cat "$file"
            echo
        fi
    done
}

# Run the script
echo "Source files and their contents in $(pwd):"
echo "============================================="
find_source_files