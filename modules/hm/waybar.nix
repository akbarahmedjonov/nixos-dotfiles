{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 28;
        spacing = 0;

        modules-left = ["niri/workspaces"];
        modules-center = ["niri/window"];
        modules-right = ["tray" "pulseaudio" "network" "battery" "clock"];

        "niri/window" = {
          max-length = 50;
        };

        tray = {
          icon-size = 16;
          spacing = 10;
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
          format = "{:%d - %H:%M}";
        };

        battery = {
          format = "{icon} {capacity}%";
          format-discharging = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}%";
          format-plugged = "";
          format-full = "󰂅";

          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };

          tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
          tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;

          states = {
            warning = 20;
            critical = 10;
          };
        };

        network = {
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format = "{icon}";
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";

          tooltip-format-wifi = "{essid} ({frequency} GHz)";
          tooltip-format-ethernet = "Connected";
          tooltip-format-disconnected = "Disconnected";

          interval = 3;
          spacing = 1;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";
          on-click = "pavucontrol";
          tooltip-format = "Playing at {volume}%";
          scroll-step = 5;

          format-icons = {
            headphone = "";
            headset = "";
            default = ["" "" ""];
          };
        };
      };
    };
  };
}
