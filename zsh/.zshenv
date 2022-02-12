#!/usr/local/bin/zsh
# .zshenv
# First file being sourced by zsh
# All environment variable definitions should go in here

# Extend runtime path
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Programs"
export PATH="$PATH:$HOME/Scripts"
export PATH="$PATH:$HOME/.cargo/bin"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# XDG setup for Wayland Sessions
export XDG_RUNTIME_DIR="/tmp/`id -u`-runtime-dir"
test -d "$XDG_RUNTIME_DIR" || { mkdir "$XDG_RUNTIME_DIR" ; chmod 700 "$XDG_RUNTIME_DIR" ; }

export LANGUAGE="de"
export TERM="xterm"
export PAGER="less"
export EDITOR="nvim" # cli editor
export VISUAL=""     # gui editor
export READER="mupdf"
export BROWSER="firefox"
. "$HOME/.cargo/env"
