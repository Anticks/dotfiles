if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship Terminal
starship init fish | source

# Rust LSP Rust Cargo and Neovim exe
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
# set -U fish_user_paths ~/.local/bin $fish_user_paths

# Python Conda 
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<

# ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Go
# set -x GOPATH (go env GOPATH) $GOPATH
# set -x GOROOT (go env GOROOT) $GOROOT
# set -x GOBIN (go env GOBIN) $GOBIN
# set -x PATH $PATH:$GOPATH/bin
# set -x PATH $PATH:$GOROOT/bin
# set -x PATH $PATH:$GOBIN/bin
