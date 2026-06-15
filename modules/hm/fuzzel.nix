{...}: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=11";
        lines = 15;
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 10;
        terminal = "foot -e";
      };

      colors = {
        background = "282828ff";
        text = "ebdbb2ff";
        match = "fe8019ff";
        selection = "3c3836ff";
        selection-match = "fabd2fff";
        selection-text = "ebdbb2ff";
        border = "7daea3ff";
      };

      border = {
        width = 2;
        radius = 0;
      };

      dmenu = {
        mode = "text";
      };
    };
  };
}
