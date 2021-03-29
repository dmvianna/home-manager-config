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
}
