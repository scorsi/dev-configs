set -gx EDITOR nvim

set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

fzf --fish | source
zoxide init fish | source

starship init fish | source

