
{ pkgs, ... }:

{
  # programs.home-manager.enable = true;
  imports = [
    ./programs/xmonad/default.nix
  ];

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    # theme = "solarized";
  };

  # services.polybar = {
  #   enable = true;
  #   settings = {
  #     "bar/top" = {
  #       monitor = "${env:MONITOR:eDP1}";
  #       width = "100%";
  #       height = "3%";
  #       radius = 0;
  #       modules-center = "date";
  #     };
  #   };
  #   script = "polybar bar &";
  # };

  services.clipmenu = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
  };
  
  services.blueman-applet = {
    enable = true;
  };
  
  services.stalonetray = {
    enable = true;
    config = {
      decorations = null;
      transparent = false;
      dockapp_mode = null;
      geometry = "8x1-0+0";
      max_geometry = "8x1-325-10";
      background = "#000000";
      kludges = "force_icons_size";
      grow_gravity = "NE";
      icon_gravity = "NE";
      icon_size = 25;
      sticky = true;
# window_strut none
      window_type = "dock";
      window_layer = "bottom";
      no_shrink = false;
      skip_taskbar = true;
    };
  };
}
