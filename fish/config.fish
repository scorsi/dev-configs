set -gx EDITOR nvim

set fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set sponge_purge_only_on_exit true
set fzf_preview_dir_cmd eza --tree --color=always
# set fzf_preview_file_cmd bat
set fzf_diff_highlighter delta --paging=never --width=20

fzf --fish | source
zoxide init fish | source

starship init fish | source

