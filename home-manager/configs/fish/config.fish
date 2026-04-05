if status is-interactive
set fish_greeting
zoxide init fish | source
fzf --fish | source
alias v="nvim"
alias hms="home-manager switch --flake ~/nixos-dotfiles/home-manager/#user"
alias nrs="sudo nixos-rebuild switch -I nixos-config=$HOME/nixos-dotfiles/configuration.nix"
alias eff='nvim (fzf -m --preview="bat --color=always {}")'
alias lg='lazygit'
alias ff='clear && nitch'
alias tl='eza --tree --icons=always --level 3'
alias rm='trash -v'
alias y='yazi'
alias oc="opencode"
alias py='python'
alias v="nvim"
alias l='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias ls='eza -a --color=always --group-directories-first --icons=always' # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always' # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"
alias la="eza -l --color=always --group-directories-first --icons=always"
alias c="clear"
alias nc="nvim ~/nixos-dotfiles/"
end
function t
    if count $argv >/dev/null
        tmux attach -t $argv[1] || tmux new -s $argv[1]
    else
        tmux attach || tmux new -s Work
    end
end
function open
    xdg-open $argv >/dev/null 2>&1 &
end
if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
  exec niri-session
end

