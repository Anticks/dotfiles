if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Starship Cross-Shell Promt
starship init fish | source

# Java
fish_add_path /opt/homebrew/opt/openjdk/bin

# Curl
fish_add_path /opt/homebrew/opt/curl/bin

# Asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Asdf Go
 . ~/.asdf/plugins/golang/set-env.fish

# PHP Bison
fish_add_path /opt/homebrew/opt/bison/bin

# Python
fish_add_path ~/Library/Python/3.9/bin

# Rust
fish_add_path ~/.cargo/bin/
