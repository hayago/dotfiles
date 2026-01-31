#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

create_symlink() {
    local src="$1"
    local dest="$2"
    local dest_dir="$(dirname "$dest")"

    # ディレクトリが存在しない場合は作成
    if [ ! -d "$dest_dir" ]; then
        echo "Creating directory: $dest_dir"
        mkdir -p "$dest_dir"
    fi

    # 既存のファイル/リンクがある場合はバックアップ
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up: $dest -> ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

echo "Setting up dotfiles..."

# zsh
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/zsh/.zshenv" "$HOME/.zshenv"

# tmux
create_symlink "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# tig
create_symlink "$DOTFILES_DIR/tig/.tigrc" "$HOME/.tigrc"

# nvim
create_symlink "$DOTFILES_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# claude
create_symlink "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
create_symlink "$DOTFILES_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# vscode (macOS)
if [ "$(uname)" = "Darwin" ]; then
    create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
fi

echo "Done!"

