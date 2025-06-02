if status is-interactive
    # Commands to run in interactive sessions can go here
    and not set -q TMUX
    and command -q tmux
    tmux attach || tmux new
end

function fish_greeting

end
starship init fish | source
enable_transience
pokego --no-title --random 1-8
fzf --fish | source
zoxide init fish | source
