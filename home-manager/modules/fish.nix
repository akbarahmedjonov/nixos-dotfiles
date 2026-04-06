{  ... }:

{
  programs.fish = {
    enable = true;

    # --- 1. INTERACTIVE SHELL INIT ---
    interactiveShellInit = ''
      set -g fish_greeting 
      zoxide init fish | source
      starship init fish | source
      fzf --fish | source
    '';

    # --- 2. LOGIN SHELL INIT (TTY AUTOSTART) ---
    loginShellInit = ''
      if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
          exec niri-session
      end
    '';

    # --- 3. ALIASES ---
    shellAliases = {
      # Core
      v   = "nvim";
      py  = "python";
      c   = "clear";
      rm  = "trash -v";
      y   = "yazi";
      lg  = "lazygit";
      oc  = "opencode";
      
      # NixOS & Home Manager
      hms = "home-manager switch --flake ~/nixos-dotfiles/home-manager/#user && stow -d ~/nixos-dotfiles/home-manager/configs -t ~ .";
      nrs = "sudo nixos-rebuild switch";
      nc  = "cd ~/nixos-dotfiles && nvim .";

      # Visuals & Navigation
      ff  = "clear && nitch";
      eff = "nvim (fzf -m --preview='bat --color=always {}')";
      
      # Eza (Modern ls)
      l   = "eza -al --color=always --group-directories-first --icons=always";
      ls  = "eza -a --color=always --group-directories-first --icons=always";
      ll  = "eza -l --color=always --group-directories-first --icons=always";
      la  = "eza -l --color=always --group-directories-first --icons=always";
      lt  = "eza -aT --color=always --group-directories-first --icons=always";
      tl  = "eza --tree --level 3 --color=always --group-directories-first --icons=always";
      "l." = "eza -a | grep -e '^\\.'";
    };

    # --- 4. FUNCTIONS ---
    functions = {
      # Smart Tmux
      t = {
        body = ''
          if count $argv >/dev/null
              tmux attach -t $argv[1] 2>/dev/null || tmux new -s $argv[1]
          else
              tmux attach 2>/dev/null || tmux new -s Work
          end
        '';
      };

      # Background Opener
      open = {
        body = ''
          command xdg-open $argv >/dev/null 2>&1 &
          disown
        '';
      };
    };
  };
}
