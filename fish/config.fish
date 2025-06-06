if status is-interactive
    # Commands to run in interactive sessions can go here
    and not set -q TMUX
    and command -q tmux
    tmux attach || tmux new
end

function fish_greeting
end
alias l ls
alias c clear
starship init fish | source
enable_transience
pokego --no-title --random 1-8
fzf --fish | source
zoxide init --cmd cd fish | source

fish_add_path /home/volty/.spicetify
