if status is-interactive
    # Commands to run in interactive sessions can go here
    and not set -q TMUX
    and command -q tmux
    tmux attach || tmux new
    atuin init fish | source
end

function fish_greeting
end

set -Ux EDITOR nvim
alias vim nvim
alias cl clear
oh-my-posh init fish --config $HOME/.config/ohmyposh.toml | source
pokego --no-title --random 1-8
zoxide init --cmd cd fish | source

fish_add_path $HOME/.spicetify
