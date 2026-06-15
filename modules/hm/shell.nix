{...}: {
  programs.fish = {
    enable = true;

    shellInit = ''
      fish_add_path "$HOME/.local/bin/"
    '';

    interactiveShellInit = ''
      set fish_greeting
      zoxide init fish | source
    '';

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles/#nixos-btw";
      l = "eza -al --color=always --group-directories-first --icons=always";
      ls = "eza -a --color=always --group-directories-first --icons=always";
      ll = "eza -l --color=always --group-directories-first --icons=always";
      lt = "eza -aT --color=always --group-directories-first --icons=always";
      "l." = "eza -a | grep -e '^\\.'";
      la = "eza -l --color=always --group-directories-first --icons=always";
      eff = "nvim (fzf --preview 'bat {}')";
      nc = "nvim ~/nixos-dotfiles";
      v = "nvim";
    };

    functions = {
      t = ''
        if count $argv >/dev/null
          tmux attach -t $argv[1] || tmux new -s $argv[1]
        else
          tmux attach || tmux new -s tmux
        end
      '';
      open = ''
        xdg-open $argv >/dev/null 2>&1 &
      '';
    };
  };
}
